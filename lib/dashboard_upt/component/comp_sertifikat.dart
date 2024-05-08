import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/color_palete.dart';

class ComponentSertifikat extends StatelessWidget {
  const ComponentSertifikat({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorPalete.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                Text("Sertifikat ISO 14001:2015", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                Text("QAIC/ID/11004-B", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                SizedBox(height: 5, width: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Re-assessment date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("21-09-2024", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
