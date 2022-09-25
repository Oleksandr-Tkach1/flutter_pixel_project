import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_cubit.dart';
import 'package:flutter_pixel_project/ui/page/authorization/cubit/authorization_state.dart';

class TemplateWidget extends StatefulWidget {

  final String title;

  const TemplateWidget(this.title, {super.key});

  @override
  _TemplateWidgetState createState() => _TemplateWidgetState();
}

class _TemplateWidgetState extends State<TemplateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
          return Container(
            child: _buildContent(context, state),
          );
        },
    );
  }

  _buildContent(BuildContext context, AuthorizationState state) {
    return Center(child: Text(widget.title));
  }
}