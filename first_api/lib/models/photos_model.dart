// ignore_for_file: unnecessary_this, prefer_collection_literals

class Photosmodel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photosmodel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photosmodel.fromJson(Map<dynamic, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data =  Map<dynamic, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}