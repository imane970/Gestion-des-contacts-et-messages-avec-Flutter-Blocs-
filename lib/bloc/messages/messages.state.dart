import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/model/messages.model.dart';

class MessagesState{
  RequestState requestState;
  List<Message> messages;
  MessageEvent currentMessageEvent;
  String messageError;
  List<Message> selectedMessages=[];
  Contact currentContact;

  MessagesState(
      {
        this.requestState,
        this.messages,
        this.currentMessageEvent,
        this.messageError,
        this.selectedMessages,
        this.currentContact
      }
      );
  MessagesState.initialState():
      requestState = RequestState.NONE,
      messages =[],
      messageError ='',
      currentMessageEvent=null,
      selectedMessages=[],
      currentContact=new Contact();
}