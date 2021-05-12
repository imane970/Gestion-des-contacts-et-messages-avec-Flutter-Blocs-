import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoWidget extends StatelessWidget {
  Contact contact;

  ContactInfoWidget({this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(child: Text("${contact.profile}"),),
          SizedBox(width: 15,),
          Text("${contact.nom}"),
        ],
      ),
    );
  }
}
