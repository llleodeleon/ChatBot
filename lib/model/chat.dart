import 'package:chatbot/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final String id;
  @JsonKey(name: 'last_message')
  final String lastMessage;
  final List<String> members;
  final String topic;
  @JsonKey(name: 'modified_at', fromJson: DateUtils.millisToDate, toJson: DateUtils.dateToMillis)
  final DateTime modifiedAt;

  Chat(this.id, this.lastMessage, this.members, this.topic, this.modifiedAt);
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

