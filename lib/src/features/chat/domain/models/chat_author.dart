enum ChatAuthor {
  user(1),
  model(2),
  undefined(0);

  final int id;
  const ChatAuthor(this.id);
  factory ChatAuthor.fromId(int id) {
    return ChatAuthor.values.firstWhere(
      (value) => value.id == id,
      orElse: () => ChatAuthor.undefined,
    );
  }
}
