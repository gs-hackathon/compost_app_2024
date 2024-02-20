class Orders {
  List<Data>? data;

  Orders({this.data});

  Orders.fromJson(Map<String, dynamic> json) {
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
  String? address;
  int? createdAt;
  int? id;
  String? image;
  List<int>? items;
  String? nId;
  String? pickUpDate;
  int? reward;
  int? updatedAt;

  Data(
      {this.address,
      this.createdAt,
      this.id,
      this.image,
      this.items,
      this.nId,
      this.pickUpDate,
      this.reward,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createdAt = json['created_at'];
    id = json['id'];
    image = json['image'];
    items = json['items'].cast<int>();
    nId = json['n_id'];
    pickUpDate = json['pick_up_date'];
    reward = json['reward'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['image'] = image;
    data['items'] = items;
    data['n_id'] = nId;
    data['pick_up_date'] = pickUpDate;
    data['reward'] = reward;
    data['updated_at'] = updatedAt;
    return data;
  }
}
