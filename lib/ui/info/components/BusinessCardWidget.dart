
import 'package:boilerplate/models/business/business.dart';
import 'package:flutter/material.dart';

class BusinessCardWidget extends StatelessWidget{
  final Business? business;

  const BusinessCardWidget({Key? key, this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text('שם העסק')),
                Expanded(child: Text('${business?.name}')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text('כתובת')),
                Expanded(child: Text('${business?.address}')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text('עיר')),
                Expanded(child: Text('${business?.city}')),
              ],
            ),
          ],
        ),
      ),
    );
  }

}