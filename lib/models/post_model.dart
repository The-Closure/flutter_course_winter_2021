class PostModel {
  List<Comments>? comments;
  String? content;
  String? createdAt;
  int? id;
  User? owner;
  List<Reactions>? reactions;
  String? title;

  PostModel(
      {this.comments,
      this.content,
      this.createdAt,
      this.id,
      this.owner,
      this.reactions,
      this.title});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = new List<Comments>.empty(growable: true);
      json['comments'].forEach((v) {
        comments?.add((new Comments.fromJson(v)));
      });
    }
    content = json['content'];
    createdAt = json['createdAt'];
    id = json['id'];
    owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
    if (json['reactions'] != null) {
      reactions = new List<Reactions>.empty(growable: true);
      json['reactions'].forEach((v) {
        reactions?.add(new Reactions.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments?.map((v) => v.toJson()).toList();
    }
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    if (this.owner != null) {
      data['owner'] = this.owner?.toJson();
    }
    if (this.reactions != null) {
      data['reactions'] = this.reactions?.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class Comments {
  String? createdAt;
  int? id;
  String? title;
  User? user;

  Comments({this.createdAt, this.id, this.title, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? login;

  User({this.id, this.login});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    return data;
  }
}

class Reactions {
  int? id;
  String? login;

  Reactions({this.id, this.login});

  Reactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    return data;
  }
}
