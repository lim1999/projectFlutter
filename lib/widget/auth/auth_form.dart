import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterchat/widget/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isloading);
  final bool isloading;
  final void Function(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _userName = '';
  var _userEmail = '';
  var _password = '';
  var _islogin = true;
  File _userImageFile;

  void _pickerImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (_userImageFile == null && !_islogin) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please pick an image"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
    if (isValid) {
      _formkey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _password.trim(),
        _userName.trim(),
        _userImageFile,
        _islogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_islogin) UserImagePicker(_pickerImage),
                  TextFormField(
                    key: ValueKey("email"),
                    validator: (value) {
                      if (value.isEmpty || !value.contains("@")) {
                        return "Please enter a valid email address.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Input your Email"),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_islogin)
                    TextFormField(
                      key: ValueKey("username"),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return "password must be at least 4 characters long.";
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: "Input your userName"),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey("password"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return "password must be at least 7 characters long.";
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(labelText: "Input your Password"),
                    onSaved: (value) {
                      _password = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (widget.isloading) CircularProgressIndicator(),
                  if (!widget.isloading)
                    RaisedButton(
                      child: Text(_islogin ? "LogIn" : "SingUp"),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isloading)
                    FlatButton(
                      child: Text(_islogin
                          ? "create new account"
                          : "I already have account"),
                      onPressed: () {
                        setState(() {
                          _islogin = !_islogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
