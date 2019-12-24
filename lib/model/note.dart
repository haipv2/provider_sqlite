class Note {
  final int userId;
  final int id;
  final String content;

  Note({this.id, this.content, this.userId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content, 'user_id': userId};
  }
}
