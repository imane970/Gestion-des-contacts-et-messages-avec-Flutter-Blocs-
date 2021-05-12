import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/message.item.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class MessagesListWidget extends StatelessWidget {
  List<Message> messages;

  ScrollController scrollController = new ScrollController();

  MessagesListWidget({this.messages});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients){
        this.scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return ListView.separated(
      controller: scrollController,
        itemBuilder: (context, index) =>
           MessageItemWidget(message: messages[index],),
        separatorBuilder: (context, index) => Divider(color: Colors.lightBlue,height: 3,),
        itemCount: messages.length
    );
  }
}
