
class TodoModel {
    TodoModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    int? userId;
    int? id;
    String? title;
    bool? completed;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        completed: json["completed"] == null ? null : json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "completed": completed == null ? null : completed,
    };
}
