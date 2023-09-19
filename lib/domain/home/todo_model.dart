class TodoModel {
  int id;
  String title;
  String discription;

  TodoModel({
    required this.id,
    required this.title,
    required this.discription,
    s,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["ID"],
        title: json["TITLE"],
        discription: json["discription"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "discription": discription,
      };
}
