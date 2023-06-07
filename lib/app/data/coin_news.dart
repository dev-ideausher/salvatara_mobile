///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class coinNewsDataSource {
/*
{
  "id": "wired",
  "name": "Wired"
}
*/

  String? id;
  String? name;

  coinNewsDataSource({
    this.id,
    this.name,
  });
  coinNewsDataSource.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class coinNewsData {
/*
{
  "source": {
    "id": "wired",
    "name": "Wired"
  },
  "author": "Antara Haldar",
  "title": "The Case That Foreshadowed the Lessons of the FTX Collapse",
  "description": "Before there was SBF, there was another “ethical crusader” who learned the same hard truths about the technology of trust.",
  "url": "https://www.wired.com/story/cryptocurrency-sbf-ftx-microfinance/",
  "urlToImage": "https://media.wired.com/photos/63a2366d2b5612eae8066cbc/191:100/w_1280,c_limit/ftx-finance-sam-bankman-fried.jpg",
  "publishedAt": "2022-12-21T14:00:00Z",
  "content": "For the past three seemingly glorious years, the 30-year-old boy wonder Sam Bankman-Fried, or SBF, crowned the King of Crypto, bore an uncanny resemblance to the legendary character Robin Hood. Using… [+4839 chars]"
}
*/

  coinNewsDataSource? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  coinNewsData({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  coinNewsData.fromJson(Map<String, dynamic> json) {
    source = (json['source'] != null) ? coinNewsDataSource.fromJson(json['source']) : null;
    author = json['author']?.toString();
    title = json['title']?.toString();
    description = json['description']?.toString();
    url = json['url']?.toString();
    urlToImage = json['urlToImage']?.toString();
    publishedAt = json['publishedAt']?.toString();
    content = json['content']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class coinNews {
/*
{
  "status": true,
  "message": "Crypto Currency Data",
  "data": [
    {
      "source": {
        "id": "wired",
        "name": "Wired"
      },
      "author": "Antara Haldar",
      "title": "The Case That Foreshadowed the Lessons of the FTX Collapse",
      "description": "Before there was SBF, there was another “ethical crusader” who learned the same hard truths about the technology of trust.",
      "url": "https://www.wired.com/story/cryptocurrency-sbf-ftx-microfinance/",
      "urlToImage": "https://media.wired.com/photos/63a2366d2b5612eae8066cbc/191:100/w_1280,c_limit/ftx-finance-sam-bankman-fried.jpg",
      "publishedAt": "2022-12-21T14:00:00Z",
      "content": "For the past three seemingly glorious years, the 30-year-old boy wonder Sam Bankman-Fried, or SBF, crowned the King of Crypto, bore an uncanny resemblance to the legendary character Robin Hood. Using… [+4839 chars]"
    }
  ]
}
*/

  bool? status;
  String? message;
  List<coinNewsData?>? data;

  coinNews({
    this.status,
    this.message,
    this.data,
  });
  coinNews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <coinNewsData>[];
      v.forEach((v) {
        arr0.add(coinNewsData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}
