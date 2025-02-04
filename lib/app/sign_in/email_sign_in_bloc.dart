import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../services/auth.dart';
import 'email_sign_in_model.dart';

class EmailSignInBloc {
  EmailSignInBloc({@required this.auth});
  final AuthBase auth;
  final StreamController<EmailSignInModel> _modelController = StreamController<EmailSignInModel>();


  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model =EmailSignInModel();
  void dispose(){
    _modelController.close();
  }

  Future<void> submit() async {
  updateWith(submitted: true, isLoading: true);
    try {
      if (_model.formType == EmailSignInFormType.signin) {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(_model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
  void toggleFormType(){
    final formType = _model.formType == EmailSignInFormType.signin
        ? EmailSignInFormType.Register: EmailSignInFormType.signin;
    updateWith(
      email: ' ',
      password: ' ',
      submitted: false,
      formType: formType,
      isLoading: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);


  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
}){
    //update model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
    //add updated model to _model/controller
    _modelController.add(_model);
  }

}