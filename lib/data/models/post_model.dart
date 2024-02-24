class Post {
  int userId;
  int id;
  String title;
  bool completed;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? "0",
      completed: json['completed'] ?? false,
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
