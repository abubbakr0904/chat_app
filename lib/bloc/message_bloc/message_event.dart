import '../../data/models/message_model/message_model.dart';

abstract class MessageManagerEvent {
  const MessageManagerEvent();
}

class AddMessageFireStoreEvent extends MessageManagerEvent {
  final MessageModel messageModell;

  AddMessageFireStoreEvent({required this.messageModell});

  List<Object?> get props => [
    messageModell,
  ];
}

class CallMessageEvent extends MessageManagerEvent {}
