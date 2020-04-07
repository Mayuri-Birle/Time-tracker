//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertimetracker/app/home_page.dart';
import 'package:fluttertimetracker/app/sign_in/sign_in_page.dart';
import 'package:fluttertimetracker/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
//  LandingPage({@required this.auth});
//  final AuthBase auth;
//  @override
//  _LandingPageState createState() => _LandingPageState();
//}
//
//class _LandingPageState extends State<LandingPage> {



//  @override
//  void initState() {
//    super.initState();
//    _checkCurrentUser();
//    widget.auth.onAuthStateChanged.listen((user) {
//      print('user: ${user?.uid}');
//    });
//  }
//
//  Future<void> _checkCurrentUser() async {
//    User user = await widget.auth.currentUser();
//    _updateUser(user);
//  }
//
//  void _updateUser(User user) {
//    setState(() {
//      _user = user;
//    });
////    print('User id: ${user.uid}');
//  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return HomePage(
//              auth: auth,
            );

          } else{
            return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
            ),
            );
          }
        }
    );
  }
}

//    if (_user == null) {
//      return SignInPage(
//        auth: widget.auth,
//        onSignIn: _updateUser,
//      );
//    }
//    return HomePage(
//      auth: widget.auth,
//      onSignOut: () => _updateUser(null),
//    );

