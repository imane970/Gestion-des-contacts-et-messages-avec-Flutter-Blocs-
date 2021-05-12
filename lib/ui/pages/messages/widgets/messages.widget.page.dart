import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:app_contacts_managment/ui/shared/circular.progress.ind.widget.dart';
import 'package:app_contacts_managment/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state){
          if(state.requestState==RequestState.LOADING){
            return MyCircularProgressIndWidget();
          }else if(state.requestState==RequestState.ERROR){
            return ErrorRetryMessage(
              errorMessage: state.messageError,
              onAction: (){
                context.read<MessagesBloc>().add(state.currentMessageEvent);
              },
            );
          }else if(state.requestState==RequestState.LOADED){
            return MessagesListWidget(messages: state.messages);
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
