// File: lib/features/chat/data/repositories/chat_repository.dart
import 'package:martva/src/features/chat/domain/entities/chat_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_repository.g.dart';

abstract class ChatRepository {
  Stream<List<ChatMessage>> getChatMessages(String chatId);
  Future<void> sendMessage(ChatMessage message);
}

class SupabaseChatRepository implements ChatRepository {
  final SupabaseClient _client;

  SupabaseChatRepository(this._client);

  @override
  Stream<List<ChatMessage>> getChatMessages(String chatId) {
    return _client
        .from('chat_messages')
        .stream(primaryKey: ['id'])
        .eq('chat_id', chatId)
        .order('timestamp')
        .map((event) =>
            event.map((json) => ChatMessage.fromJson(json)).toList());
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    await _client.from('chat_messages').insert(message.toJson());
  }
}

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  final client = Supabase.instance.client;
  return SupabaseChatRepository(client);
}
