import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:app_contacts_managment/repositories/messages.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class MessagesBloc extends Bloc<MessageEvent, MessagesState>{

  MessagesRepository messagesRepository;

  MessagesBloc({@required MessagesState initialState, @required this.messagesRepository}) : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessageEvent event) async*{

    if(event is MessagesByContactEvent){
      yield new MessagesState(requestState: RequestState.LOADING, messages: state.messages, currentMessageEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      try{
        List<Message> data = await this.messagesRepository.messagesByContact(event.payload.id);
        yield new MessagesState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      }catch(e){
        print(e);
        yield new MessagesState(requestState: RequestState.ERROR, messages: state.messages, messageError: e.toString(), currentMessageEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      }
    }
    else if(event is AddNewMessageEvent){
      //yield new MessagesState(requestState: RequestState.LOADING, messages: state.messages, currentMessageEvent: event);
      try{
        event.payload.date = DateTime.now();
        Message message = await this.messagesRepository.addNewMessage(event.payload);
        List<Message> data = [...state.messages];
        data.add(message);
        yield new MessagesState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event, selectedMessages: state.selectedMessages, currentContact: state.currentContact);
      }catch(e){
        print(e);
        yield new MessagesState(requestState: RequestState.ERROR, messages: state.messages, messageError: e.toString(), currentMessageEvent: event, selectedMessages: state.selectedMessages, currentContact: state.currentContact);
      }
    }
    else if(event is SelectMessageEvent){
      List<Message> messages = state.messages;
      List<Message> selected = [...state.selectedMessages];

      for(Message m in messages){
        if(m.id==event.payload.id){
          m.selected=!m.selected;
        }
        if(m.selected==true){
          selected.add(m);
        }
        else{
          selected.removeWhere((element) => element.id==m.id);
        }
      }
      MessagesState messagesState = MessagesState(messages: messages, selectedMessages: selected, currentMessageEvent: event, requestState: RequestState.LOADED, currentContact: state.currentContact);
      yield messagesState;
    }
    else if(event is DeleteMessagesEvent){
      List<Message> messages = state.messages;
      List<Message> selected = [...state.selectedMessages];

      for(Message m in selected){
        try{
          await messagesRepository.deleteMessage(m);
          messages.removeWhere((element) => element.id==m.id);
          MessagesState messagesState = MessagesState(messages: messages, selectedMessages: selected, currentMessageEvent: event, requestState: RequestState.LOADED,currentContact: state.currentContact);
          yield messagesState;
        }catch(e){
          MessagesState messagesState = MessagesState(messages: messages, selectedMessages: selected, currentMessageEvent: event, requestState: RequestState.ERROR, currentContact: state.currentContact);
          yield messagesState;        }
      }

    }



  }

}