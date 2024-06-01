import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/color_palete.dart';

class ComponentSampah extends StatelessWidget {
  const ComponentSampah({super.key, this.sampahDarat, this.sampahDaratOrganik, this.sampahDaratAnorganik, this.sampahDaratDiolah});
  final String? sampahDarat;
  final String? sampahDaratOrganik;
  final String? sampahDaratAnorganik;
  final String? sampahDaratDiolah;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(

            padding: const EdgeInsets.only(top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: ColorPalete.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                const SizedBox(
                  child: Icon(Icons.delete, color: Colors.white,),
                ),
                Text(sampahDarat ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
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
                    Text(sampahDaratOrganik ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
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
                    Text(sampahDaratAnorganik ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                    const Text("Sampah Anorganik", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  ],
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 5),
              //   width:double.infinity,
              //   decoration: BoxDecoration(
              //       color: ColorPalete.primaryColor,
              //       borderRadius: const BorderRadius.all(Radius.circular(10))
              //   ),
              //   child: Column(
              //     children: [
              //       Text(sampahDaratDiolah ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
              //       const Text("Sampah Diolah", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
              //     ],
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
