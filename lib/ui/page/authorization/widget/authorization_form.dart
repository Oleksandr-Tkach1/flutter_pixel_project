import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_cubit.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_state.dart';

class AuthorizationFormWidget extends StatefulWidget {
  final AuthorizationState state;

  const AuthorizationFormWidget(this.state, {super.key});

  @override
  _AuthorizationFormWidgetState createState() => _AuthorizationFormWidgetState();
}

class _AuthorizationFormWidgetState extends State<AuthorizationFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _confirmCodeTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailTextController.text = widget.state.email;
    _confirmCodeTextController.text = widget.state.confirmCode;
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _confirmCodeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 20.0),
                  child: Text('Authorization Page'),
                ),
                TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      enabled: true),
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.always,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _confirmCodeTextController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock),
                      enabled: true),
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.always,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 32.0, bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 42.0, right: 42.0),
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthorizationCubit>(context).authenticate(
                      _emailTextController.value.text,
                      _confirmCodeTextController.value.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}