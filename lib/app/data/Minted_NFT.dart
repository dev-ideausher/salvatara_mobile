///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class MintedNFTArrCollectionIdUserKyc {
/*
{
  "documentType": "document",
  "front": "hj",
  "back": "hj"
}
*/

  String? documentType;
  String? front;
  String? back;

  MintedNFTArrCollectionIdUserKyc({
    this.documentType,
    this.front,
    this.back,
  });
  MintedNFTArrCollectionIdUserKyc.fromJson(Map<String, dynamic> json) {
    documentType = json['documentType']?.toString();
    front = json['front']?.toString();
    back = json['back']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['documentType'] = documentType;
    data['front'] = front;
    data['back'] = back;
    return data;
  }
}

class MintedNFTArrCollectionIdUser {
/*
{
  "kyc": {
    "documentType": "document",
    "front": "hj",
    "back": "hj"
  },
  "_id": "63a5ad10c2f6161a4052a4b0",
  "email": "yaman@ideausher.com",
  "userType": "partner",
  "firebaseUid": "2FmAPc8o8DhLHmiZFDkLT466KdI2",
  "firebaseSignInProvider": "password",
  "active": true,
  "isDeleted": false,
  "otp": 0,
  "following": [
    "639842017fc4760970aeba98"
  ],
  "followers": [
    null
  ],
  "followingCount": 1,
  "followersCount": 0,
  "createdAt": "2022-12-23T13:28:48.854Z",
  "updatedAt": "2023-02-27T06:43:14.541Z",
  "walletId": "kjbhb",
  "cor": "hjkk",
  "dob": "2022-12-12T07:46:32.733Z",
  "firstname": "salvatara",
  "lastname": "tseting",
  "selfie": "https://media.istockphoto.com/id/475836292/photo/clouds-rolling-between-hills-of-himachal.jpg?s=612x612&w=0&k=20&c=orTwGIhfXYnJPMpnkq70AL5IQPSLj0XeLVgn-EjjdyM=",
  "name": "yaman"
}
*/

  MintedNFTArrCollectionIdUserKyc? kyc;
  String? Id;
  String? email;
  String? userType;
  String? firebaseUid;
  String? firebaseSignInProvider;
  bool? active;
  bool? isDeleted;
  int? otp;
  List<String?>? following;

  int? followingCount;
  int? followersCount;
  String? createdAt;
  String? updatedAt;
  String? walletId;
  String? cor;
  String? dob;
  String? firstname;
  String? lastname;
  String? selfie;
  String? name;

  MintedNFTArrCollectionIdUser({
    this.kyc,
    this.Id,
    this.email,
    this.userType,
    this.firebaseUid,
    this.firebaseSignInProvider,
    this.active,
    this.isDeleted,
    this.otp,
    this.following,

    this.followingCount,
    this.followersCount,
    this.createdAt,
    this.updatedAt,
    this.walletId,
    this.cor,
    this.dob,
    this.firstname,
    this.lastname,
    this.selfie,
    this.name,
  });
  MintedNFTArrCollectionIdUser.fromJson(Map<String, dynamic> json) {
    kyc = (json['kyc'] != null) ? MintedNFTArrCollectionIdUserKyc.fromJson(json['kyc']) : null;
    Id = json['_id']?.toString();
    email = json['email']?.toString();
    userType = json['userType']?.toString();
    firebaseUid = json['firebaseUid']?.toString();
    firebaseSignInProvider = json['firebaseSignInProvider']?.toString();
    active = json['active'];
    isDeleted = json['isDeleted'];
    otp = json['otp']?.toInt();
    if (json['following'] != null) {
      final v = json['following'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      following = arr0;
    }

    followersCount = json['followersCount']?.toInt();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    walletId = json['walletId']?.toString();
    cor = json['cor']?.toString();
    dob = json['dob']?.toString();
    firstname = json['firstname']?.toString();
    lastname = json['lastname']?.toString();
    selfie = json['selfie']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (kyc != null) {
      data['kyc'] = kyc!.toJson();
    }
    data['_id'] = Id;
    data['email'] = email;
    data['userType'] = userType;
    data['firebaseUid'] = firebaseUid;
    data['firebaseSignInProvider'] = firebaseSignInProvider;
    data['active'] = active;
    data['isDeleted'] = isDeleted;
    data['otp'] = otp;
    if (following != null) {
      final v = following;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['following'] = arr0;
    }

    data['followersCount'] = followersCount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['walletId'] = walletId;
    data['cor'] = cor;
    data['dob'] = dob;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['selfie'] = selfie;
    data['name'] = name;
    return data;
  }
}

class MintedNFTArrCollectionId {
/*
{
  "_id": "6405bc5781c8351497284a80",
  "title": "collection1",
  "category": "png",
  "description": "collection description",
  "externalLink": "https://www.collection.io",
  "explicit_sensitive": true,
  "royalty": 1,
  "profile": "profile link",
  "cover": "cover link",
  "user": {
    "kyc": {
      "documentType": "document",
      "front": "hj",
      "back": "hj"
    },
    "_id": "63a5ad10c2f6161a4052a4b0",
    "email": "yaman@ideausher.com",
    "userType": "partner",
    "firebaseUid": "2FmAPc8o8DhLHmiZFDkLT466KdI2",
    "firebaseSignInProvider": "password",
    "active": true,
    "isDeleted": false,
    "otp": 0,
    "following": [
      "639842017fc4760970aeba98"
    ],
    "followers": [
      null
    ],
    "followingCount": 1,
    "followersCount": 0,
    "createdAt": "2022-12-23T13:28:48.854Z",
    "updatedAt": "2023-02-27T06:43:14.541Z",
    "walletId": "kjbhb",
    "cor": "hjkk",
    "dob": "2022-12-12T07:46:32.733Z",
    "firstname": "salvatara",
    "lastname": "tseting",
    "selfie": "https://media.istockphoto.com/id/475836292/photo/clouds-rolling-between-hills-of-himachal.jpg?s=612x612&w=0&k=20&c=orTwGIhfXYnJPMpnkq70AL5IQPSLj0XeLVgn-EjjdyM=",
    "name": "yaman"
  },
  "createdAt": "2023-03-06T10:11:35.414Z",
  "updatedAt": "2023-03-06T10:11:35.414Z"
}
*/

  String? Id;
  String? title;
  String? category;
  String? description;
  String? externalLink;
  bool? explicitSensitive;
  int? royalty;
  String? profile;
  String? cover;
  MintedNFTArrCollectionIdUser? user;
  String? createdAt;
  String? updatedAt;

  MintedNFTArrCollectionId({
    this.Id,
    this.title,
    this.category,
    this.description,
    this.externalLink,
    this.explicitSensitive,
    this.royalty,
    this.profile,
    this.cover,
    this.user,
    this.createdAt,
    this.updatedAt,
  });
  MintedNFTArrCollectionId.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    title = json['title']?.toString();
    category = json['category']?.toString();
    description = json['description']?.toString();
    externalLink = json['externalLink']?.toString();
    explicitSensitive = json['explicit_sensitive'];
    royalty = json['royalty']?.toInt();
    profile = json['profile']?.toString();
    cover = json['cover']?.toString();
    user = (json['user'] != null) ? MintedNFTArrCollectionIdUser.fromJson(json['user']) : null;
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['externalLink'] = externalLink;
    data['explicit_sensitive'] = explicitSensitive;
    data['royalty'] = royalty;
    data['profile'] = profile;
    data['cover'] = cover;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MintedNFTArr {
/*
{
  "_id": "6405c5c157a35b9247987069",
  "title": "The Bored Ape",
  "category": "png",
  "description": "Bored Ape #79 looks almost as bored as I feel when I think about NFTs (non-fungible tokens) and their supposedly seismic impact on art. My jaw slides, my eyelids hang down and I want to pick lice from my fur.",
  "price": 0.01,
  "externalLink": "qwertyui",
  "explicit_sensitive": true,
  "stats": true,
  "royalty": 3,
  "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-gallery1125.webp",
  "fileType": "image",
  "market": "setPrice",
  "status": "Minted",
  "collectionId": {
    "_id": "6405bc5781c8351497284a80",
    "title": "collection1",
    "category": "png",
    "description": "collection description",
    "externalLink": "https://www.collection.io",
    "explicit_sensitive": true,
    "royalty": 1,
    "profile": "profile link",
    "cover": "cover link",
    "user": {
      "kyc": {
        "documentType": "document",
        "front": "hj",
        "back": "hj"
      },
      "_id": "63a5ad10c2f6161a4052a4b0",
      "email": "yaman@ideausher.com",
      "userType": "partner",
      "firebaseUid": "2FmAPc8o8DhLHmiZFDkLT466KdI2",
      "firebaseSignInProvider": "password",
      "active": true,
      "isDeleted": false,
      "otp": 0,
      "following": [
        "639842017fc4760970aeba98"
      ],
      "followers": [
        null
      ],
      "followingCount": 1,
      "followersCount": 0,
      "createdAt": "2022-12-23T13:28:48.854Z",
      "updatedAt": "2023-02-27T06:43:14.541Z",
      "walletId": "kjbhb",
      "cor": "hjkk",
      "dob": "2022-12-12T07:46:32.733Z",
      "firstname": "salvatara",
      "lastname": "tseting",
      "selfie": "https://media.istockphoto.com/id/475836292/photo/clouds-rolling-between-hills-of-himachal.jpg?s=612x612&w=0&k=20&c=orTwGIhfXYnJPMpnkq70AL5IQPSLj0XeLVgn-EjjdyM=",
      "name": "yaman"
    },
    "createdAt": "2023-03-06T10:11:35.414Z",
    "updatedAt": "2023-03-06T10:11:35.414Z"
  },
  "owner": null,
  "views": 0,
  "favourites": 0,
  "tokenId": "39",
  "contractAddress": "0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
  "platFormFee": 0,
  "createdAt": "2023-03-06T10:51:45.001Z",
  "updatedAt": "2023-03-06T10:51:45.001Z"
}
*/

  String? Id;
  String? title;
  String? category;
  String? description;
  double? price;
  String? externalLink;
  bool? explicitSensitive;
  bool? stats;
  int? royalty;
  String? imageURL;
  String? fileType;
  String? market;
  String? status;
  MintedNFTArrCollectionId? collectionId;
  String? owner;
  int? views;
  int? favourites;
  String? tokenId;
  String? contractAddress;
  int? platFormFee;
  String? createdAt;
  String? updatedAt;

  MintedNFTArr({
    this.Id,
    this.title,
    this.category,
    this.description,
    this.price,
    this.externalLink,
    this.explicitSensitive,
    this.stats,
    this.royalty,
    this.imageURL,
    this.fileType,
    this.market,
    this.status,
    this.collectionId,
    this.owner,
    this.views,
    this.favourites,
    this.tokenId,
    this.contractAddress,
    this.platFormFee,
    this.createdAt,
    this.updatedAt,
  });
  MintedNFTArr.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    title = json['title']?.toString();
    category = json['category']?.toString();
    description = json['description']?.toString();
    price = json['price']?.toDouble();
    externalLink = json['externalLink']?.toString();
    explicitSensitive = json['explicit_sensitive'];
    stats = json['stats'];
    royalty = json['royalty']?.toInt();
    imageURL = json['imageURL']?.toString();
    fileType = json['fileType']?.toString();
    market = json['market']?.toString();
    status = json['status']?.toString();
    collectionId = (json['collectionId'] != null) ? MintedNFTArrCollectionId.fromJson(json['collectionId']) : null;
    owner = json['owner']?.toString();
    views = json['views']?.toInt();
    favourites = json['favourites']?.toInt();
    tokenId = json['tokenId']?.toString();
    contractAddress = json['contractAddress']?.toString();
    platFormFee = json['platFormFee']?.toInt();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['price'] = price;
    data['externalLink'] = externalLink;
    data['explicit_sensitive'] = explicitSensitive;
    data['stats'] = stats;
    data['royalty'] = royalty;
    data['imageURL'] = imageURL;
    data['fileType'] = fileType;
    data['market'] = market;
    data['status'] = status;
    if (collectionId != null) {
      data['collectionId'] = collectionId!.toJson();
    }
    data['owner'] = owner;
    data['views'] = views;
    data['favourites'] = favourites;
    data['tokenId'] = tokenId;
    data['contractAddress'] = contractAddress;
    data['platFormFee'] = platFormFee;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MintedNFT {
/*
{
  "status": true,
  "results": 1,
  "message": "nft list",
  "arr": [
    {
      "_id": "6405c5c157a35b9247987069",
      "title": "The Bored Ape",
      "category": "png",
      "description": "Bored Ape #79 looks almost as bored as I feel when I think about NFTs (non-fungible tokens) and their supposedly seismic impact on art. My jaw slides, my eyelids hang down and I want to pick lice from my fur.",
      "price": 0.01,
      "externalLink": "qwertyui",
      "explicit_sensitive": true,
      "stats": true,
      "royalty": 3,
      "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-gallery1125.webp",
      "fileType": "image",
      "market": "setPrice",
      "status": "Minted",
      "collectionId": {
        "_id": "6405bc5781c8351497284a80",
        "title": "collection1",
        "category": "png",
        "description": "collection description",
        "externalLink": "https://www.collection.io",
        "explicit_sensitive": true,
        "royalty": 1,
        "profile": "profile link",
        "cover": "cover link",
        "user": {
          "kyc": {
            "documentType": "document",
            "front": "hj",
            "back": "hj"
          },
          "_id": "63a5ad10c2f6161a4052a4b0",
          "email": "yaman@ideausher.com",
          "userType": "partner",
          "firebaseUid": "2FmAPc8o8DhLHmiZFDkLT466KdI2",
          "firebaseSignInProvider": "password",
          "active": true,
          "isDeleted": false,
          "otp": 0,
          "following": [
            "639842017fc4760970aeba98"
          ],
          "followers": [
            null
          ],
          "followingCount": 1,
          "followersCount": 0,
          "createdAt": "2022-12-23T13:28:48.854Z",
          "updatedAt": "2023-02-27T06:43:14.541Z",
          "walletId": "kjbhb",
          "cor": "hjkk",
          "dob": "2022-12-12T07:46:32.733Z",
          "firstname": "salvatara",
          "lastname": "tseting",
          "selfie": "https://media.istockphoto.com/id/475836292/photo/clouds-rolling-between-hills-of-himachal.jpg?s=612x612&w=0&k=20&c=orTwGIhfXYnJPMpnkq70AL5IQPSLj0XeLVgn-EjjdyM=",
          "name": "yaman"
        },
        "createdAt": "2023-03-06T10:11:35.414Z",
        "updatedAt": "2023-03-06T10:11:35.414Z"
      },
      "owner": null,
      "views": 0,
      "favourites": 0,
      "tokenId": "39",
      "contractAddress": "0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
      "platFormFee": 0,
      "createdAt": "2023-03-06T10:51:45.001Z",
      "updatedAt": "2023-03-06T10:51:45.001Z"
    }
  ]
}
*/

  bool? status;
  int? results;
  String? message;
  List<MintedNFTArr?>? arr;

  MintedNFT({
    this.status,
    this.results,
    this.message,
    this.arr,
  });
  MintedNFT.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results']?.toInt();
    message = json['message']?.toString();
    if (json['arr'] != null) {
      final v = json['arr'];
      final arr0 = <MintedNFTArr>[];
      v.forEach((v) {
        arr0.add(MintedNFTArr.fromJson(v));
      });
      arr = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    data['message'] = message;
    if (arr != null) {
      final v = arr;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['arr'] = arr0;
    }
    return data;
  }
}
