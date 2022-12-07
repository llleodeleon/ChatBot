// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      json['id'] as String,
      json['last_message'] as String,
      (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      json['topic'] as String,
      DateUtils.millisToDate(json['modified_at'] as int),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'last_message': instance.lastMessage,
      'members': instance.members,
      'topic': instance.topic,
      'modified_at': DateUtils.dateToMillis(instance.modifiedAt),
    };
