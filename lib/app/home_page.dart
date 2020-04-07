import 'package:flutter/material.dart';
import 'package:fluttertimetracker/common_widgets/platform_alert_button.dart';
import 'package:fluttertimetracker/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
//  HomePage({@required this.auth});
//  final VoidCallback onSignOut;
//  final AuthBase auth;

  Future<void> _signOut(BuildContext context) async {
    try{
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
//      await FirebaseAuth.instance.signOut();
//      onSignOut();
  }
  catch(e){
      print(e.toString());
  }
}
  Future<void> _confirmSignOut(BuildContext context) async{
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if(didRequestSignOut == true){
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
    );
  }
}
