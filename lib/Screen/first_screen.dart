import 'package:flutter/material.dart';
import 'package:game/Components/image_button.dart';
import 'package:game/Components/image_container.dart';
import 'package:game/Components/tooltip_dialog.dart';
import 'package:game/Screen/success_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  int step = 0;

  void cutTheBottle() {
    setState(() {
      step = 1;
    });
  }

  void cleanTheBottle() {
    setState(() {
      step = 2;
    });
  }

  void addSoil() {
    setState(() {
      step = 3;
    });
  }

  void putTheBottleTogether() {
    setState(() {
      step = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Little Garden",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: EdgeInsets.all(21.0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => TooltipDialog('Instructions',
                          '1. Take 2-litre bottle \n 2. Cut it into half \n 3. Clean thoroughly \n 4. Drag the upper half then put the soil in \n 5. Place it in the bottom half \n \n Done!!'),
                    );
                  },
                  icon: Icon(
                    Icons.message,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ),
              ),
              if (step == 0) ...[
                ImagesContainer('assets/images/empty_bottle.png')
              ] else if (step == 1) ...[
                ImagesContainer('assets/images/top_half_bottle.png')
              ] else if (step == 2) ...[
                ImagesContainer('assets/images/top_half_bottle.png')
              ] else if (step == 3) ...[
                ImagesContainer('assets/images/plant_in_top_half_bottle.png')
              ] else ...[
                ImagesContainer('assets/images/combind_bottle.png')
              ],
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButton("assets/images/scissor.png", () {
                    if (step == 0) {
                      cutTheBottle();
                      print(step);
                    }
                  }),
                  ImageButton('assets/images/tissue.png', () {
                    if (step != 0 && step == 1) {
                      cleanTheBottle();
                      print(step);
                    }
                  }),
                  ImageButton('assets/images/plant.png', () {
                    if (step != 0 && step == 2) {
                      addSoil();
                      print(step);
                    }
                  }),
                  ImageButton('assets/images/bottom_half_bottle.png', () {
                    if (step != 0 && step == 3) {
                      putTheBottleTogether();
                      print(step);
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SuccessScreen()));
                      });
                    }
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
