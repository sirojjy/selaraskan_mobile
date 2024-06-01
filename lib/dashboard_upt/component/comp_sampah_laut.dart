import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/color_palete.dart';

class ComponentSampahLaut extends StatelessWidget {
  const ComponentSampahLaut({super.key, this.sampahLaut, this.sampahLautOrganik, this.sampahLautAnorganik, this.sampahLautDiolah});
  final String? sampahLaut;
  final String? sampahLautOrganik;
  final String? sampahLautAnorganik;
  final String? sampahLautDiolah;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(

            padding: const EdgeInsets.only(top: 40, bottom: 40),
            decoration: BoxDecoration(
              color: ColorPalete.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                const SizedBox(
                  child: Icon(Icons.delete, color: Colors.white,),
                ),
                Text(sampahLaut ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                const Text("Sampah Darat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5,width: 5,),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text(sampahLautOrganik ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    const Text("Sampah Organik", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text(sampahLautAnorganik ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    const Text("Sampah Anorganik", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: ColorPalete.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Text(sampahLautDiolah ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    const Text("Sampah Diolah", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
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
