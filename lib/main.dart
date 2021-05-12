import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:app_contacts_managment/bloc/contacts.state.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/repositories/contact.repository.dart';
import 'package:app_contacts_managment/repositories/messages.repository.dart';
import 'package:app_contacts_managment/ui/pages/contacts/contacts.page.dart';
import 'package:app_contacts_managment/ui/pages/contactsWithMessages/contacts.messages.page.dart';
import 'package:app_contacts_managment/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => MessagesBloc(
          initialState: MessagesState.initialState(),
          messagesRepository: GetIt.instance<MessagesRepository>(),
          ),
        ),

        BlocProvider(create: (context) => ContactsBloc(
          initialState: ContactsState(contacts: [], requestState: RequestState.NONE, errorMessage: ''),
          contactsRepository: GetIt.instance<ContactsRepository>(),
          messagesBloc: context.read<MessagesBloc>(),
          ),
        ),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CONTACT MANAGMENT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/contacts":(context) => ContactPage(),
          "/messages":(context) => MessagesPage(),
          "/contactWithMessages":(context) => ContactAndMessages()
        },
        initialRoute: "/contactWithMessages",
      ),
    );
  }
}

