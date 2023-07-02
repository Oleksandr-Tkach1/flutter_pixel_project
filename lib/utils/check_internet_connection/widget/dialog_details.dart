import 'package:flutter/material.dart';

class DialogDetails extends StatelessWidget {
  final Color color;
  final String internetStatus;
  final int removeTime;
  final bool removeDialogue;

  const DialogDetails(
      {super.key,
      required this.color,
      required this.internetStatus,
      required this.removeTime,
      required this.removeDialogue});

  @override
   build(BuildContext context) {
    return FutureBuilder(
        future: timerRemoveDialog(context),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return snapshot.data;
          }
          return Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: color,
            child: Center(
                child: Text(internetStatus,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
          );
        }
    );
  }
  timerRemoveDialog(BuildContext context) async{
    if(removeDialogue){
      return Future.delayed(Duration(seconds: removeTime), () {
        return Container();
      });
    }else{
      return;
    }
  }
}