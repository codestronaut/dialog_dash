import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_author.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const Chat._();

  @JsonSerializable()
  const factory Chat({
    required String id,
    required int authorId,
    required String content,
    required DateTime dateTime,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  ChatAuthor get author => ChatAuthor.fromId(authorId);
}
