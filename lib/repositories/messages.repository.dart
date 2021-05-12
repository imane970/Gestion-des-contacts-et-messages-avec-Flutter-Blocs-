import 'dart:math';

import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:flutter/material.dart';

class MessagesRepository{
  int messageCount;

  Map<int, Message> messages={
    1:new Message(id: 1, contactID: 1, date: DateTime.now(), content: "hello sdlkdf lksdlqmk sdmqskd sldkqmsldkmlk qsldkqmlsk qlskdmlqsk lmkqsldk qslkd mqlk lqskdm lkqmlskd mehdi", type: "Sent",selected: false),
    2:new Message(id: 2, contactID: 1, date: DateTime.now(), content: "hello mekosdlm sdml sdmlsml smldms smlsdmlzp sdmlmzl sd^lmd lsdmlz uar", type: "Received",selected: false),
    3:new Message(id: 3, contactID: 1, date: DateTime.now(), content: "hello anas", type: "Received",selected: false),
    4:new Message(id: 4, contactID: 1, date: DateTime.now(), content: "hello ali", type: "Sent",selected: false),
    5:new Message(id: 5, contactID: 2, date: DateTime.now(), content: "hello amal", type: "Received",selected: false),
    6:new Message(id: 6, contactID: 3, date: DateTime.now(), content: "hello ahmed", type: "Sent",selected: false),
    7:new Message(id: 7, contactID: 2, date: DateTime.now(), content: "hello simo", type: "Sent",selected: false),
    8:new Message(id: 8, contactID: 3, date: DateTime.now(), content: "hello simo", type: "Sent",selected: false),
  };


  MessagesRepository(){
    this.messageCount = this.messages.length;
  }


  Future<List<Message>> allMessages() async{
    var future =await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 1){
      return messages.values.toList();
    }else{
      throw new Exception("failed connection");
    }

  }

  Future<List<Message>> messagesByContact(int contactID) async{
    var future =await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 1){
      return messages.values.toList().where((element) => element.contactID==contactID).toList();
    }else{
      throw new Exception("failed connection");
    }

  }
  Future<Message> addNewMessage(Message message) async{
    var future =await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 1){
      message.id = ++messageCount;
      messages[message.id]=message;
      return message;
    }else{
      throw new Exception("failed connection");
    }

  }

  Future<void> deleteMessage(Message message) async{
    var future =await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 0){
      messages.remove(message.id);
    }else{
      throw new Exception("failed connection");
    }

  }


}