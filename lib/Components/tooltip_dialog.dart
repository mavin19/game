import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TooltipDialog extends StatelessWidget {
  final String title;
  final String description;

  const TooltipDialog(this.title, this.description) : super();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContents(context),
    );
  }
  dialogContents(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(
           16.0,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {Navigator.pop(context);},
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}


