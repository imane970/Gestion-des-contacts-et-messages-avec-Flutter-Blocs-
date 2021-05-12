import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:app_contacts_managment/bloc/contacts.actions.dart';
import 'package:app_contacts_managment/bloc/contacts.state.dart';
import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.list.widgets.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.widget.page.dart';
import 'package:app_contacts_managment/ui/shared/circular.progress.ind.widget.dart';
import 'package:app_contacts_managment/ui/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class ContactAndMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state){
        return Scaffold(
            appBar: MyAppBarWidget(state.currentContact),
            body: Column(
              children: [
                ContactListHorizontaleWidget(),
                MessagesWidget(),
                BlocBuilder<ContactsBloc, ContactsState>(
                    builder: (context, state) {
                      return MessagesFormWidget(state.currentContact);
                    }
                ),
              ],
            )
        );
      },
    );
  }
}
