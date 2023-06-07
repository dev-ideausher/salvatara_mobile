import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:number_system/number_system.dart';
import 'package:salvatara/app/data/Minted_NFT.dart';
import 'package:salvatara/app/modules/MintNFT/controllers/mint_n_f_t_controller.dart';
import 'package:salvatara/app/modules/NFT/controllers/nft_controller.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/modules/nftDetails/controllers/nft_details_controller.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallet_connect_utils.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/dialog_helper.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

String maticRpcUri = 'https://data-seed-prebsc-1-s1.binance.org:8545/';

class Web3Connect extends GetxService {
  // Web3Connect();
  final account = "".obs;
  late WalletConnectEthereumCredentials credentials;
  late WalletConnect connector;
  final sessionStatus = false.obs;
  var accountAddress = ''.obs;

  String rpcUrl = 'https://data-seed-prebsc-2-s1.binance.org:8545/';

  late SessionStatus? session;
  int chainId = 80001;

  //default rinkeby

  enterRpcUrl(String rpcUrl) {
    this.rpcUrl = rpcUrl;
  }

  enterChainId(int chainId) {
    this.chainId = chainId;
  }

  connect() async {
    await _walletConnect();
    // await initWalletConnect();
  }

  disconnect() async {
    final sessionStorage = WalletConnectSecureStorage();
    await connector.killSession();
    await sessionStorage.removeSession();
    await  sessionStorage.getSession();
    account.value = '';
    sessionStatus.value = false;
  }

  _walletConnect() async {
    final sessionStorage = WalletConnectSecureStorage();
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Salvatara',
        description: 'Salvatara',
        url: 'https://www.salvatara.com',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
      sessionStorage: sessionStorage,
    );
    // Subscribe to events
    connector.on('connect', (session) => print(session));
    connector.on('session_update', (payload) => print(payload));
    connector.on('disconnect', (session) => print(session));

    //Create a new session
    //await launch uri lets you choose which wallet you want to connect to
    if (!connector.connected) {
      session = await connector.createSession(
          chainId: chainId, onDisplayUri: (uri) async => await launch(uri));
      sessionStatus.value = true;
      if(session?.chainId == 80001) {
        snackBarClass("Wallet Connected").SuccesSnackBar;
    }else{

         disconnect();
       snackBarClass("Trying to connect the wrong chain! please change your network to polygon").ErrorSnackBar;
      }
    }
    account.value = session!.accounts[0];

    if (account.value != "") {
      //  final client = Web3Client("https://data-seed-prebsc-2-s1.binance.org:8545/", Client());
      EthereumWalletConnectProvider provider =
          EthereumWalletConnectProvider(connector, chainId: 80001);
      credentials = WalletConnectEthereumCredentials(provider: provider);
    }
  }

  Future initWalletConnect() async {
    final sessionStorage = WalletConnectSecureStorage();
    final sessions = await sessionStorage.getSession();
    accountAddress.value = sessions!.accounts[0] == null ? "" : sessions.accounts[0];

    // print(sessions!.peerMeta);
    //  print(sessions.accounts);
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'MogoVerse',
        description: 'Mogo',
        url: 'https://www.mogoverse.com',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
      session: sessions,
      sessionStorage: sessionStorage,
    );
    // Subscribe to events
    connector.on('connect', (session) =>
        print(session));
    connector.on('session_update', (payload) => print(payload));
    connector.on('disconnect', (session) => print(session));

    // Create a new session
    // await launch uri lets you choose which wallet you want to connect to
    if (!connector.connected) {
      session = await connector.createSession(
          chainId: chainId, onDisplayUri: (uri) async => await launch(uri));
      sessionStatus.value = true;
      session?.chainId == 80001 ? SizedBox() : disconnect();
    }
    account.value = sessions.accounts[0];

    if (account.value != "") {
      sessionStatus.value = true;
      //  final client = Web3Client("https://data-seed-prebsc-2-s1.binance.org:8545/", Client());
      EthereumWalletConnectProvider provider = EthereumWalletConnectProvider(connector, chainId: 97);
      credentials = WalletConnectEthereumCredentials(provider: provider);
    }
  }

  var salvaCoinAddress = "0x4488B55C644cFF5843E47dcb4567de46Fd8FBe16";
  var ContractAddress = "0x3f07bc10D19C128D6d42344aed3FA6731FF88e55";

  //"0x497cccca1DFD703Ce008A0f7E5eA853CC9DAd4D1";

  Future<String> contractSalvaCoin({required var amount}) async {

    var signature = '';

    final abiCodeSalva = await rootBundle.loadString('assets/SalvaCoinAbi.json');

    final contract = DeployedContract(
        ContractAbi.fromJson(abiCodeSalva, 'MetaCoin'),
        EthereumAddress.fromHex('${salvaCoinAddress}'));

    final ethereum =
        Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());

    final approve = contract.function('approve');

    try {
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: approve,
          parameters: [
            EthereumAddress.fromHex('${ContractAddress}'),
            BigInt.parse("${(amount * 1000000000000000000).round()}")
          ],
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {
      } else {
        return signature;

        // Get.toNamed(Routes.DONATION_SUCCES,arguments: [signature]);

        // Get.defaultDialog(
        //     title: '',
        //     content:
        //     radius: 10.0);

        Get.snackbar("Meesage", "Transaction Approved by MetaMask");
      }
      print(signature);
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }

  Future<String> contractCallBuyNFT(
      {required var amount, required var tokenID}) async {
   await initWalletConnect();
    var signature = '';
    final abiCode =
        await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum =
        Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    final buyNFT = contract.function('buyNFT');
    try {
      Get.snackbar("Message", "Request sent please open MetaMask");
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: buyNFT,
          parameters: [BigInt.parse("${tokenID}")],
          value: EtherAmount.inWei(
              BigInt.parse("${(amount * 1000000000000000000).round()}")),
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {
      } else {
        return signature;
      }
      print(signature);
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }



  Future<String> contractCallBuyNFTSalva(
      { required var tokenID}) async {
   await initWalletConnect();
    var signature = '';
    final abiCode =
    await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum =
    Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    final buyNFT = contract.function('buyNFT');
    try {
      Get.snackbar("Message", "Request sent please open MetaMask");
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: buyNFT,
          parameters: [BigInt.parse("${tokenID}")],
          // value: EtherAmount.inWei(
          //     BigInt.parse("${(amount * 1000000000000000000).round()}")),
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {
      } else {
        return signature;
      }
      print(signature);
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }

  Future<String> contractCallMintFT(
      {required String tokenURI, required var royalityPercentage}) async {
    await initWalletConnect();
    var signature = '';
    final abiCode = await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum = Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    // final transferEvent = contract.events;
    final createNFT = contract.function('createNFT');
    final transferEvent = contract.event("createdNFT");

    try {
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: createNFT,
          parameters: ["${tokenURI}", BigInt.parse("${royalityPercentage}")],
          //value: EtherAmount.inWei(BigInt.parse("${(amount * 1000000000000000000).round()}")),
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {
      } else {
        DialogHelper.showLoading();
        Future.delayed(const Duration(seconds: 6), () async{
          TransactionReceipt? rec = await ethereum.getTransactionReceipt(signature);
          print(rec?.logs.first.topics?[3]);
          print(int.parse('${rec?.logs.first.topics?[3]}'.replaceAll("0x", ''), radix: 16));
          var TokenId = int.parse('${rec?.logs.first.topics?[3]}'.replaceAll("0x", ''), radix: 16);
          await  Get.find<MintNFTController>().createNFT(txnHash: "${signature}",TokenID: "${TokenId}");
          await Get.find<ProfileController>().getMintedNFTDetails();
          Get.snackbar("Message", "NFT Minted");
          Get.back();
          await DialogHelper.hideDialog();
          //await Get.find<ProfileController>().getMintedNFTDetails();

          return signature;

        });

      }
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }

  Future<bool> getNFTDetails({required String TokenID}) async {
    final abiCode =
        await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));

    final ethereum =
        Web3Client('https://rpc-mumbai.maticvigil.com/', http.Client());

    final getNFTdetails = contract.function('getNFTDetails');
    List callContract = await ethereum.call(
        contract: contract,
        function: getNFTdetails,
        params: [BigInt.parse("${TokenID}")]);
    print("List : ${callContract[0][7]}");
    var isMatic = callContract[0][7];
    return isMatic;
  }

  Future<String> getListingFee() async {
    final abiCode =
    await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));

    final ethereum =
    Web3Client('https://rpc-mumbai.maticvigil.com/', http.Client());

    final getNFTdetails = contract.function('listingFee');
    List callContract = await ethereum.call(
        contract: contract,
        function: getNFTdetails,
        params: []
    );

    print("List : ${callContract[0]}");
    var Listingfee = callContract[0];

    return Listingfee.toString();
  }

  Future<String> contractCallSellNFT(
      {required var amount,
      required var tokenID,
      required bool isMatic,
        required String ListingFee,

      }) async {
    var signature = '';
    final abiCode =
        await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum =
        Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    final listNFT = contract.function('listNFT');

    try {
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: listNFT,
          parameters: [
            BigInt.parse("${tokenID}"),
            BigInt.parse("${(amount * 1000000000000000000).round()}"),
            isMatic
          ],
          value: EtherAmount.inWei(BigInt.parse("${double.parse(ListingFee).round()}")),
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {
      } else {
        return signature;
        // Get.toNamed(Routes.DONATION_SUCCES,arguments: [signature]);

        // Get.defaultDialog(
        //     title: '',
        //     content:
        //     radius: 10.0);
        Get.snackbar("Meesage", "Transaction Approved by MetaMask");
      }
      print(signature);
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }

  // Future<String> CancelListing({required String TokenID}) async {
  //   final abiCode =
  //   await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
  //   final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
  //       EthereumAddress.fromHex('${ContractAddress}'));
  //
  //   final ethereum =
  //   Web3Client('https://rpc-mumbai.maticvigil.com/', http.Client());
  //
  //   final getNFTdetails = contract.function('cancelListing');
  //
  //   List callContract = await ethereum.call(
  //       contract: contract,
  //       function: getNFTdetails,
  //       params: [BigInt.parse(TokenID)]
  //   );
  //
  //   print("List : ${callContract}");
  //   var Listingfee = callContract[0];
  //
  //   return Listingfee.toString();
  // }



  Future<String> CancelListing(
      {required String TokenID,
      }) async {
    var signature = '';
    final abiCode =
    await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum =
    Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    final listNFT = contract.function('cancelListing');

    try {
      signature = await ethereum.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: listNFT,
          parameters: [
            BigInt.parse("${TokenID}"),
          ],
       //   value: EtherAmount.inWei(BigInt.parse("${double.parse(ListingFee).round()}")),
          from: EthereumAddress.fromHex('${accountAddress.value}'),
        ),
      );
      print(signature);
      if (signature.isEmpty) {

      } else {

       await Get.find<NftDetailsController>().postCancelListing(hash: "${signature}");
        Get.find<NftController>().onInit();
        return signature;

        // Get.toNamed(Routes.DONATION_SUCCES,arguments: [signature]);

        // Get.defaultDialog(
        //     title: '',
        //     content:
        //     radius: 10.0);

        Get.snackbar("Meesage", "Transaction Approved by MetaMask");
      }
      print(signature);
    } catch (e) {
      Get.snackbar("Error", "${e}");
      print(e);
    }
    return signature;
  }

  @override
  onInit() async {
    await initWalletConnect();
    super.onInit();
  }

  Future<void> getRecipt({required String transactionAddress}) async {
    final abiCode =
        await rootBundle.loadString('assets/SalvataraNFTMarketplace_abi.json');
    final contract = DeployedContract(ContractAbi.fromJson(abiCode, 'MetaCoin'),
        EthereumAddress.fromHex('${ContractAddress}'));
    final ethereum =
        Web3Client('https://rpc-mumbai.maticvigil.com', http.Client());
    // final transferEvent = contract.events;
    //final createNFT = contract.function('createdNFT');
    TransactionReceipt? sc = await ethereum.getTransactionReceipt(
        "0xbbadff50c7d1baf701b41205be3bde8bcb46649954d176ce68d057b17e862871");
    // var scd =  await  ethereum.getTransactionReceipt("${transactionAddress}");
    log("${sc?.logs.first.topics?[3]}");

    print(int.parse('${sc?.logs.first.topics?[3]}'.replaceAll("0x", ''),
        radix: 16));
  }
}

// WalletID
// Name
// Following Count
// Follower Count
