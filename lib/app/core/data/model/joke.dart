class Joke {
  final int id;
  final String content;
  bool isFunny;

  Joke({required this.id, required this.content, this.isFunny = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'isFunny': isFunny ? 1 : 0,
    };
  }
}