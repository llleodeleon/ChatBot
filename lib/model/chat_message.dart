import 'package:chatbot/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  final String id;
  final String message;
  @JsonKey(name: 'modified_at', fromJson: DateUtils.millisToDate, toJson: DateUtils.dateToMillis)
  final DateTime modifiedAt;
  final String sender;

  ChatMessage({required this.id, required this.message, required this.modifiedAt, required this.sender});
  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}