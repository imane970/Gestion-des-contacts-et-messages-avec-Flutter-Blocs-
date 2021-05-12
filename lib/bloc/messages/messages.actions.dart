import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/model/messages.model.dart';

abstract class MessageEvent<T>{
  T payload;
  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact>{
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message>{
  AddNewMessageEvent(payload) : super(payload);
}


class SelectMessageEvent extends MessageEvent<Message>{
  SelectMessageEvent(payload) : super(payload);
}

class DeleteMessagesEvent extends MessageEvent{
  DeleteMessagesEvent() : super(null);
}
