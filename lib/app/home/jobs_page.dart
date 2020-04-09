import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertimetracker/app/home/models/job.dart';
import 'package:fluttertimetracker/common_widgets/platform_alert_button.dart';
import 'package:fluttertimetracker/common_widgets/platform_exception_alert_dialog.dart';
import 'package:fluttertimetracker/services/auth.dart';
import 'package:fluttertimetracker/services/database.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
//  JobsPage({@required this.auth});
//  final VoidCallback onSignOut;
//  final AuthBase auth;

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
//      await FirebaseAuth.instance.signOut();
//      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _createJob(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context);
      database.createJob(Job(name: 'Nikita', ratePerHour: 6));
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(title: 'Operation Failed', exception: e)
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    database.readJobs();
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs', textAlign: TextAlign.center),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () => _createJob(context), child: Icon(Icons.add)),
    );
  }
}
