import 'package:chat_app/data/models/message_model/message_model.dart';
import 'package:chat_app/data/models/user_model/user_model.dart';

abstract class MessageState {}

class MessageInitialState extends MessageState {}

class MessageLoadingState extends MessageState {}

class MessageSuccessState extends MessageState {
  MessageSuccessState({required this.users});

  final List<MessageModel> users;
}

class MessageErrorState extends MessageState {
  MessageErrorState({required this.errorText});

  final String errorText;
}

class UserDeletedState extends MessageState {}
