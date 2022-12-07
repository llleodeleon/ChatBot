// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      json['id'] as String,
      json['message'] as String,
      DateUtils.millisToDate(json['modified_at'] as int),
      json['sender'] as String,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'modified_at': DateUtils.dateToMillis(instance.modifiedAt),
      'sender': instance.sender,
    };
