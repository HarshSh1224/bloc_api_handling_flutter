class Post {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Post({this.userId, this.id, this.title, this.completed});

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
