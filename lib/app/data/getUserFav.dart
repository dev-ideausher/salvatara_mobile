///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class getUserFavFavouritesNftIdCollectionIdUserKyc {
/*
{
  "documentType": "",
  "front": "",
  "back": ""
}
*/

  String? documentType;
  String? front;
  String? back;

  getUserFavFavouritesNftIdCollectionIdUserKyc({
    this.documentType,
    this.front,
    this.back,
  });
  getUserFavFavouritesNftIdCollectionIdUserKyc.fromJson(Map<String, dynamic> json) {
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

class getUserFavFavouritesNftIdCollectionIdUser {
/*
{
  "kyc": {
    "documentType": "",
    "front": "",
    "back": ""
  },
  "name": "",
  "walletId": "",
  "cor": "",
  "otp": 0,
  "selfie": "",
  "followingCount": 0,
  "followersCount": 0,
  "_id": "6387379c57d3748467f918b8",
  "email": "salvataraadmin@yopmail.com",
  "password": "330d0bd6804122f85c6ab5916ec2f893",
  "userType": "admin",
  "firebaseUid": "N4qhJUaovtfPWxuSfaUp2xgXHh53",
  "firebaseSignInProvider": "custom",
  "active": true,
  "isDeleted": false,
  "createdAt": "2022-11-22T04:41:36.789Z",
  "updatedAt": "2023-01-25T06:54:32.260Z",
  "username": "SalvtaraAdmin"
}
*/

  getUserFavFavouritesNftIdCollectionIdUserKyc? kyc;
  String? name;
  String? walletId;
  String? cor;
  int? otp;
  String? selfie;
  int? followingCount;
  int? followersCount;
  String? Id;
  String? email;
  String? password;
  String? userType;
  String? firebaseUid;
  String? firebaseSignInProvider;
  bool? active;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? username;

  getUserFavFavouritesNftIdCollectionIdUser({
    this.kyc,
    this.name,
    this.walletId,
    this.cor,
    this.otp,
    this.selfie,
    this.followingCount,
    this.followersCount,
    this.Id,
    this.email,
    this.password,
    this.userType,
    this.firebaseUid,
    this.firebaseSignInProvider,
    this.active,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.username,
  });
  getUserFavFavouritesNftIdCollectionIdUser.fromJson(Map<String, dynamic> json) {
    kyc = (json['kyc'] != null) ? getUserFavFavouritesNftIdCollectionIdUserKyc.fromJson(json['kyc']) : null;
    name = json['name']?.toString();
    walletId = json['walletId']?.toString();
    cor = json['cor']?.toString();
    otp = json['otp']?.toInt();
    selfie = json['selfie']?.toString();
    followingCount = json['followingCount']?.toInt();
    followersCount = json['followersCount']?.toInt();
    Id = json['_id']?.toString();
    email = json['email']?.toString();
    password = json['password']?.toString();
    userType = json['userType']?.toString();
    firebaseUid = json['firebaseUid']?.toString();
    firebaseSignInProvider = json['firebaseSignInProvider']?.toString();
    active = json['active'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    username = json['username']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (kyc != null) {
      data['kyc'] = kyc!.toJson();
    }
    data['name'] = name;
    data['walletId'] = walletId;
    data['cor'] = cor;
    data['otp'] = otp;
    data['selfie'] = selfie;
    data['followingCount'] = followingCount;
    data['followersCount'] = followersCount;
    data['_id'] = Id;
    data['email'] = email;
    data['password'] = password;
    data['userType'] = userType;
    data['firebaseUid'] = firebaseUid;
    data['firebaseSignInProvider'] = firebaseSignInProvider;
    data['active'] = active;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['username'] = username;
    return data;
  }
}

class getUserFavFavouritesNftIdCollectionId {
/*
{
  "_id": "6396db993170223e9f80c5f8",
  "title": "collection1",
  "category": "gif",
  "description": "collection description",
  "externalLink": "https://www.collection.io",
  "explicit_sensitive": true,
  "royalty": 1,
  "profile": "https://salvatara.s3.amazonaws.com/salvatara-gallerygolden-ape.webp",
  "cover": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryunnamed-2.webp",
  "createdAt": "2022-12-12T07:43:21.946Z",
  "updatedAt": "2022-12-12T07:43:21.946Z",
  "user": {
    "kyc": {
      "documentType": "",
      "front": "",
      "back": ""
    },
    "name": "",
    "walletId": "",
    "cor": "",
    "otp": 0,
    "selfie": "",
    "followingCount": 0,
    "followersCount": 0,
    "_id": "6387379c57d3748467f918b8",
    "email": "salvataraadmin@yopmail.com",
    "password": "330d0bd6804122f85c6ab5916ec2f893",
    "userType": "admin",
    "firebaseUid": "N4qhJUaovtfPWxuSfaUp2xgXHh53",
    "firebaseSignInProvider": "custom",
    "active": true,
    "isDeleted": false,
    "createdAt": "2022-11-22T04:41:36.789Z",
    "updatedAt": "2023-01-25T06:54:32.260Z",
    "username": "SalvtaraAdmin"
  }
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
  String? createdAt;
  String? updatedAt;
  getUserFavFavouritesNftIdCollectionIdUser? user;

  getUserFavFavouritesNftIdCollectionId({
    this.Id,
    this.title,
    this.category,
    this.description,
    this.externalLink,
    this.explicitSensitive,
    this.royalty,
    this.profile,
    this.cover,
    this.createdAt,
    this.updatedAt,
    this.user,
  });
  getUserFavFavouritesNftIdCollectionId.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    title = json['title']?.toString();
    category = json['category']?.toString();
    description = json['description']?.toString();
    externalLink = json['externalLink']?.toString();
    explicitSensitive = json['explicit_sensitive'];
    royalty = json['royalty']?.toInt();
    profile = json['profile']?.toString();
    cover = json['cover']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    user = (json['user'] != null) ? getUserFavFavouritesNftIdCollectionIdUser.fromJson(json['user']) : null;
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
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class getUserFavFavouritesNftId {
/*
{
  "_id": "63f4d073aec1ae746df89cd6",
  "title": "random nft",
  "category": "png",
  "description": "Desc",
  "price": 100,
  "externalLink": "xyz",
  "explicit_sensitive": true,
  "stats": true,
  "royalty": 10,
  "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryScreenshot%20%285%29.png",
  "fileType": "image",
  "market": "setPrice",
  "status": "OnSale",
  "collectionId": {
    "_id": "6396db993170223e9f80c5f8",
    "title": "collection1",
    "category": "gif",
    "description": "collection description",
    "externalLink": "https://www.collection.io",
    "explicit_sensitive": true,
    "royalty": 1,
    "profile": "https://salvatara.s3.amazonaws.com/salvatara-gallerygolden-ape.webp",
    "cover": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryunnamed-2.webp",
    "createdAt": "2022-12-12T07:43:21.946Z",
    "updatedAt": "2022-12-12T07:43:21.946Z",
    "user": {
      "kyc": {
        "documentType": "",
        "front": "",
        "back": ""
      },
      "name": "",
      "walletId": "",
      "cor": "",
      "otp": 0,
      "selfie": "",
      "followingCount": 0,
      "followersCount": 0,
      "_id": "6387379c57d3748467f918b8",
      "email": "salvataraadmin@yopmail.com",
      "password": "330d0bd6804122f85c6ab5916ec2f893",
      "userType": "admin",
      "firebaseUid": "N4qhJUaovtfPWxuSfaUp2xgXHh53",
      "firebaseSignInProvider": "custom",
      "active": true,
      "isDeleted": false,
      "createdAt": "2022-11-22T04:41:36.789Z",
      "updatedAt": "2023-01-25T06:54:32.260Z",
      "username": "SalvtaraAdmin"
    }
  },
  "views": 0,
  "favourites": 1,
  "favourite": true
}
*/

  String? Id;
  String? title;
  String? category;
  String? description;
  int? price;
  String? externalLink;
  bool? explicitSensitive;
  bool? stats;
  int? royalty;
  String? imageURL;
  String? fileType;
  String? market;
  String? status;
  getUserFavFavouritesNftIdCollectionId? collectionId;
  int? views;
  int? favourites;
  bool? favourite;

  getUserFavFavouritesNftId({
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
    this.views,
    this.favourites,
    this.favourite,
  });
  getUserFavFavouritesNftId.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    title = json['title']?.toString();
    category = json['category']?.toString();
    description = json['description']?.toString();
    price = json['price']?.toInt();
    externalLink = json['externalLink']?.toString();
    explicitSensitive = json['explicit_sensitive'];
    stats = json['stats'];
    royalty = json['royalty']?.toInt();
    imageURL = json['imageURL']?.toString();
    fileType = json['fileType']?.toString();
    market = json['market']?.toString();
    status = json['status']?.toString();
    collectionId = (json['collectionId'] != null) ? getUserFavFavouritesNftIdCollectionId.fromJson(json['collectionId']) : null;
    views = json['views']?.toInt();
    favourites = json['favourites']?.toInt();
    favourite = json['favourite'];
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
    data['views'] = views;
    data['favourites'] = favourites;
    data['favourite'] = favourite;
    return data;
  }
}

class getUserFavFavourites {
/*
{
  "_id": "63aaf0b3c2f6161a4052a501",
  "userId": "63a5ad10c2f6161a4052a4b0",
  "nftId": {
    "_id": "63f4d073aec1ae746df89cd6",
    "title": "random nft",
    "category": "png",
    "description": "Desc",
    "price": 100,
    "externalLink": "xyz",
    "explicit_sensitive": true,
    "stats": true,
    "royalty": 10,
    "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryScreenshot%20%285%29.png",
    "fileType": "image",
    "market": "setPrice",
    "status": "OnSale",
    "collectionId": {
      "_id": "6396db993170223e9f80c5f8",
      "title": "collection1",
      "category": "gif",
      "description": "collection description",
      "externalLink": "https://www.collection.io",
      "explicit_sensitive": true,
      "royalty": 1,
      "profile": "https://salvatara.s3.amazonaws.com/salvatara-gallerygolden-ape.webp",
      "cover": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryunnamed-2.webp",
      "createdAt": "2022-12-12T07:43:21.946Z",
      "updatedAt": "2022-12-12T07:43:21.946Z",
      "user": {
        "kyc": {
          "documentType": "",
          "front": "",
          "back": ""
        },
        "name": "",
        "walletId": "",
        "cor": "",
        "otp": 0,
        "selfie": "",
        "followingCount": 0,
        "followersCount": 0,
        "_id": "6387379c57d3748467f918b8",
        "email": "salvataraadmin@yopmail.com",
        "password": "330d0bd6804122f85c6ab5916ec2f893",
        "userType": "admin",
        "firebaseUid": "N4qhJUaovtfPWxuSfaUp2xgXHh53",
        "firebaseSignInProvider": "custom",
        "active": true,
        "isDeleted": false,
        "createdAt": "2022-11-22T04:41:36.789Z",
        "updatedAt": "2023-01-25T06:54:32.260Z",
        "username": "SalvtaraAdmin"
      }
    },
    "views": 0,
    "favourites": 1,
    "favourite": true
  },
  "createdAt": "2022-12-27T13:18:43.724Z",
  "updatedAt": "2023-02-27T05:53:01.407Z"
}
*/

  String? Id;
  String? userId;
  getUserFavFavouritesNftId? nftId;
  String? createdAt;
  String? updatedAt;

  getUserFavFavourites({
    this.Id,
    this.userId,
    this.nftId,
    this.createdAt,
    this.updatedAt,
  });
  getUserFavFavourites.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    userId = json['userId']?.toString();
    nftId = (json['nftId'] != null) ? getUserFavFavouritesNftId.fromJson(json['nftId']) : null;
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['userId'] = userId;
    if (nftId != null) {
      data['nftId'] = nftId!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class getUserFav {
/*
{
  "status": true,
  "favourites": [
    {
      "_id": "63aaf0b3c2f6161a4052a501",
      "userId": "63a5ad10c2f6161a4052a4b0",
      "nftId": {
        "_id": "63f4d073aec1ae746df89cd6",
        "title": "random nft",
        "category": "png",
        "description": "Desc",
        "price": 100,
        "externalLink": "xyz",
        "explicit_sensitive": true,
        "stats": true,
        "royalty": 10,
        "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryScreenshot%20%285%29.png",
        "fileType": "image",
        "market": "setPrice",
        "status": "OnSale",
        "collectionId": {
          "_id": "6396db993170223e9f80c5f8",
          "title": "collection1",
          "category": "gif",
          "description": "collection description",
          "externalLink": "https://www.collection.io",
          "explicit_sensitive": true,
          "royalty": 1,
          "profile": "https://salvatara.s3.amazonaws.com/salvatara-gallerygolden-ape.webp",
          "cover": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryunnamed-2.webp",
          "createdAt": "2022-12-12T07:43:21.946Z",
          "updatedAt": "2022-12-12T07:43:21.946Z",
          "user": {
            "kyc": {
              "documentType": "",
              "front": "",
              "back": ""
            },
            "name": "",
            "walletId": "",
            "cor": "",
            "otp": 0,
            "selfie": "",
            "followingCount": 0,
            "followersCount": 0,
            "_id": "6387379c57d3748467f918b8",
            "email": "salvataraadmin@yopmail.com",
            "password": "330d0bd6804122f85c6ab5916ec2f893",
            "userType": "admin",
            "firebaseUid": "N4qhJUaovtfPWxuSfaUp2xgXHh53",
            "firebaseSignInProvider": "custom",
            "active": true,
            "isDeleted": false,
            "createdAt": "2022-11-22T04:41:36.789Z",
            "updatedAt": "2023-01-25T06:54:32.260Z",
            "username": "SalvtaraAdmin"
          }
        },
        "views": 0,
        "favourites": 1,
        "favourite": true
      },
      "createdAt": "2022-12-27T13:18:43.724Z",
      "updatedAt": "2023-02-27T05:53:01.407Z"
    }
  ]
}
*/

  bool? status;
  List<getUserFavFavourites?>? favourites;

  getUserFav({
    this.status,
    this.favourites,
  });
  getUserFav.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['favourites'] != null) {
      final v = json['favourites'];
      final arr0 = <getUserFavFavourites>[];
      v.forEach((v) {
        arr0.add(getUserFavFavourites.fromJson(v));
      });
      favourites = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (favourites != null) {
      final v = favourites;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['favourites'] = arr0;
    }
    return data;
  }
}