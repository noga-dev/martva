import 'package:martva/src/core/features/auth/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_service.g.dart';

enum ChatType { direct, group, city }

class ChatMessage {
  final String id;
  final String senderId;
  final String? receiverId;
  final String? groupId;
  final String? cityId;
  final String content;
  final DateTime createdAt;

  ChatMessage({
    required this.id,
    required this.senderId,
    this.receiverId,
    this.groupId,
    this.cityId,
    required this.content,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      groupId: json['group_id'],
      cityId: json['city_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

@riverpod
class ChatService extends _$ChatService {
  @override
  Stream<List<ChatMessage>> build(ChatType type, String id) {
    final user = ref.watch(authServiceProvider);
    if (user == null) return Stream.value([]);

    String table;
    String column;
    switch (type) {
      case ChatType.direct:
        table = 'direct_messages';
        column = 'receiver_id';
        break;
      case ChatType.group:
        table = 'group_messages';
        column = 'group_id';
        break;
      case ChatType.city:
        table = 'city_messages';
        column = 'city_id';
        break;
    }

    return Supabase.instance.client
        .from(table)
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((event) => event
            .map((json) => ChatMessage.fromJson(json))
            .where((message) => type == ChatType.direct
                ? (message.senderId == user.id && message.receiverId == id) ||
                    (message.senderId == id && message.receiverId == user.id)
                : message.groupId == id || message.cityId == id)
            .toList());
  }

  Future<void> sendMessage(ChatType type, String id, String content) async {
    final user = ref.read(authServiceProvider);
    if (user == null) return;

    String table;
    Map<String, dynamic> data = {
      'sender_id': user.id,
      'content': content,
    };

    switch (type) {
      case ChatType.direct:
        table = 'direct_messages';
        data['receiver_id'] = id;
        break;
      case ChatType.group:
        table = 'group_messages';
        data['group_id'] = id;
        break;
      case ChatType.city:
        table = 'city_messages';
        data['city_id'] = id;
        break;
    }

    await Supabase.instance.client.from(table).insert(data);
  }
}
