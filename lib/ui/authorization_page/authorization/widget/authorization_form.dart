import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_pixel_project/utils/form_validation.dart';
import 'package:flutter_svg/svg.dart';
import '../cubit/authorization_cubit.dart';
import '../cubit/authorization_state.dart';

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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: [
                 Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 20.0),
                  child: SvgPicture.asset('assets/gad_logo.svg', width: 150),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  style: TextStyle(color: CustomColors.primaryBlack.shade200),
                  controller: _emailTextController,
                  validator: (value) => FormValidation.email(value!),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)
                        ),
                        borderSide: BorderSide(color: CustomColors.primaryBlack.shade200, width: 2),
                      ),
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20)), borderSide: BorderSide(color: CustomColors.primaryBlack.shade200)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)
                        ),
                        borderSide: BorderSide(
                            color: CustomColors.primaryBlack.shade200,
                            width: 2
                        ),
                    ),
                      labelText:'Email',
                      labelStyle: TextStyle(
                          color: CustomColors.primaryBlack.shade200),
                      prefixIcon: Icon(Icons.email, color: CustomColors.primaryBlack.shade200),
                      enabled: true),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: TextStyle(color: CustomColors.primaryBlack.shade200),
                  controller: _confirmCodeTextController,
                  validator: (value) => FormValidation.password(value!),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(20)
                        ),
                        borderSide: BorderSide(color: CustomColors.primaryBlack.shade200, width: 2),
                      ),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: CustomColors.primaryBlack.shade200),
                      prefixIcon: Icon(Icons.lock, color: CustomColors.primaryBlack.shade200),
                      enabled: true),
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 3.0, right: 3.0, top: 52.0, bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthorizationCubit>(context).authenticate(
                      _emailTextController.value.text,
                      _confirmCodeTextController.value.text);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 56),
                backgroundColor: AppColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }
}