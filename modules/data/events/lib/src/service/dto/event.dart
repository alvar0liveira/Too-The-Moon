class Event {
  late int id;
  late String name;
  late String description;
  late String featureImage;

  Event(this.id, this.name, this.description, this.featureImage);

  Event.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json["id"] as int;
    name = json["name"] as String;
    description = json["description"] as String;
    featureImage = json["feature_image"] as String;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'feature_image': featureImage
      };
}
