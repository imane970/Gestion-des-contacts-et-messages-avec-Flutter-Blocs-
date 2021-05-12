import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:app_contacts_managment/bloc/contacts.state.dart';
import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.horizontale.item.widget.dart';
import 'package:app_contacts_managment/ui/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class ContactListHorizontaleWidget extends StatelessWidget {
  ScrollController scrollController = new ScrollController();



  @override
  Widget build(BuildContext context) {


    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state){
        if(state.requestState==RequestState.LOADING){
          return Center(
              child: CircularProgressIndicator()
          );
        }else if(state.requestState==RequestState.ERROR){
          return ErrorRetryMessage(
            onAction: (){
              context.read<ContactsBloc>().add(state.currentEvent);
            },
            errorMessage: state.errorMessage,
          );
        }else if(state.requestState==RequestState.LOADED){
          return SizedBox(
            height: 150,
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) =>
                  ContactsHorizontale(
                    contact: state.contacts[index],
                    index: index,
                    scrollController: scrollController,
                  ),
              itemCount: state.contacts.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }else{
          return Container();
        }

      },
    );
  }
}
