import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/message_model/message_model.dart';
import 'message_event.dart';
import 'message_state.dart';


class MessageBloc extends Bloc<MessageManagerEvent, MessageState> {
  MessageBloc() : super(MessageInitialState()) {
    on<CallMessageEvent>(_getAllMessage);
    on<AddMessageFireStoreEvent>(_addMessageCloudStore);
  }


  _addMessageCloudStore(AddMessageFireStoreEvent event, emit) async {
    final fireDb = FirebaseFirestore.instance;
    await fireDb.collection("messages").add(event.messageModell.toJson());
  }

  _getAllMessage(CallMessageEvent event, emit) async {
    emit(MessageLoadingState());
    final db = FirebaseFirestore.instance;
    emit(MessageSuccessState(users: await db.collection("messages").get().then((value) =>
        value.docs.map((e) => MessageModel.fromJson(e.data())).toList(),),),);
  }
}
