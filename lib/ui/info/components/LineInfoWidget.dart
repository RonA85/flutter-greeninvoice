
import 'package:flutter/material.dart';

class LineInfoWidget extends StatelessWidget{
  final String? title;
  final String? info;

  const LineInfoWidget({Key? key, this.title, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Text(title!)),
            Expanded(child: Text(info!))
          ],
        ),
      ),
    );
  }

}