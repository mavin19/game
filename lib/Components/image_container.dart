import 'package:flutter/material.dart';

class ImagesContainer extends StatelessWidget {
  final String images;

  const ImagesContainer(this.images) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Image(
        image: AssetImage(images),
      ),
    );
  }
}
