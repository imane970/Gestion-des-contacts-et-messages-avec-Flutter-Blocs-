import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:app_contacts_managment/bloc/contacts.actions.dart';
import 'package:app_contacts_managment/bloc/contacts.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:app_contacts_managment/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CONTACT MANAGEMENT"),
        ),
        body: Column(
          children: [
            ContactsBarButtons(),
            Expanded(
              child: BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, state){
                  if(state.requestState == RequestState.LOADING){
                    return Center(child: CircularProgressIndicator());
                  }else if(state.requestState == RequestState.ERROR){
                    return ErrorRetryMessage(
                      errorMessage: state.errorMessage,
                      onAction:(){
                        context.read<ContactsBloc>().add(state.currentEvent);
                      },
                    );
                  }else if(state.requestState== RequestState.LOADED){
                    return ContactsList(contacts: state.contacts,);
                  }else{
                    return Container();
                  }
                },

              ),
            )
          ],
        ));
  }
}
