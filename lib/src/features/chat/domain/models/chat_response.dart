import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
class ChatResponse with _$ChatResponse {
  const ChatResponse._();

  @JsonSerializable()
  const factory ChatResponse({
    required String userId,
    required List<Chat> items,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}
