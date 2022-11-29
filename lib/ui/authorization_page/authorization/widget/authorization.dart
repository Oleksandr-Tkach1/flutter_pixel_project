import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_bloc.dart';
import 'package:flutter_pixel_project/bloc/auth/auth_event.dart';
import 'package:flutter_pixel_project/ui/app_alert.dart';
import '../../../../utils/bottom_sheet_dialog.dart';
import '../cubit/authorization_cubit.dart';
import '../cubit/authorization_state.dart';
import 'authorization_form.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});
  @override
  _AuthorizationWidgetState createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationCubit, AuthorizationState>(
      listener: (context, state) {
        if (state.alertStatus == AlertStatus.visibility) {
          bottomSheetDialog(context, state);
          return;
        } else if (state.status == AuthorizationStatus.complete) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          return;
        }
        if (state.status == AuthorizationStatus.error) {
          showDialog(
            context: context,
            builder: (_) => AppAlertDialog(message: state.errorMessage),
          );
        }
      },
      child: BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildContent(context, state)],
          );
        },
      ),
    );
  }

  _buildContent(BuildContext context, AuthorizationState state) {
    if (state.status == AuthorizationStatus.loading) {
      return const Loading();
    } else {
      return AuthorizationFormWidget(state);
    }
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(
        child: CircularProgressIndicator(),
      );
}