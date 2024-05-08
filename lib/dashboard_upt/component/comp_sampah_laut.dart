import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/color_palete.dart';

class ComponentSampahLaut extends StatelessWidget {
  const ComponentSampahLaut({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(

            padding: EdgeInsets.only(top: 40, bottom: 40),
            decoration: BoxDecoration(
              color: ColorPalete.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                SizedBox(
                  child: Icon(Icons.delete, color: Colors.white,),
                ),
                Text("45.294 Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                Text("Sampah Darat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
              ],
            ),
          ),
        ),
        SizedBox(height: 5,width: 5,),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text("45.294 Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("Sampah Darat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text("45.294 Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("Sampah Darat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text("45.294 Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("Sampah Darat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
