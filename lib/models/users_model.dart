class Users {
  List<Data>? data;

  Users({this.data});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      data = <Data>[];
      json['list'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['list'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Challenges>? challenges;
  int? createdAt;
  String? nId;
  String? name;
  double? points;
  String? surname;
  int? updatedAt;

  Data(
      {this.challenges,
      this.createdAt,
      this.nId,
      this.name,
      this.points,
      this.surname,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['challenges'] != null) {
      challenges = <Challenges>[];
      json['challenges'].forEach((v) {
        challenges!.add(Challenges.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    nId = json['n_id'];
    name = json['name'];
    points = json['points'];
    surname = json['surname'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (challenges != null) {
      data['challenges'] = challenges!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['n_id'] = nId;
    data['name'] = name;
    data['points'] = points;
    data['surname'] = surname;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Challenges {
  String? continentName;
  int? createdAt;
  String? description;
  int? duration;
  int? durationType;
  int? id;
  String? image;
  String? name;
  double? reward;
  String? shortDescription;
  int? updatedAt;

  Challenges(
      {this.continentName,
      this.createdAt,
      this.description,
      this.duration,
      this.durationType,
      this.id,
      this.image,
      this.name,
      this.reward,
      this.shortDescription,
      this.updatedAt});

  Challenges.fromJson(Map<String, dynamic> json) {
    continentName = json['continent_name'];
    createdAt = json['created_at'];
    description = json['description'];
    duration = json['duration'];
    durationType = json['duration_type'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    reward = json['reward'];
    shortDescription = json['short_description'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['continent_name'] = continentName;
    data['created_at'] = createdAt;
    data['description'] = description;
    data['duration'] = duration;
    data['duration_type'] = durationType;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['reward'] = reward;
    data['short_description'] = shortDescription;
    data['updated_at'] = updatedAt;
    return data;
  }
}
