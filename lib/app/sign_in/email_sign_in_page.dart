
import 'package:flutter/material.dart';
import 'package:fluttertimetracker/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:fluttertimetracker/app/sign_in/email_sign_in_form_change_notifier.dart';
import 'package:fluttertimetracker/app/sign_in/email_sign_in_form_stateful.dart';

class EmailSignInPage extends StatelessWidget {
//  EmailSignInPage({@required this.auth});
//  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(child: EmailSignInFormChangeNotifier.create(context)),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer() {
    return Container();
  }
}
