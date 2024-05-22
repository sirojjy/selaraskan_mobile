import 'package:flutter/material.dart';

import '../../menu_program/daftar_program.dart';

class TotalProgramLingkungan extends StatelessWidget {
   const TotalProgramLingkungan({super.key, this.totalProgram, this.programMandatory, this.programVoluntary});
  final String? totalProgram;
  final String? programMandatory;
  final String? programVoluntary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const DaftarProgram()));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff0269fd),
                Colors.purpleAccent,
                Colors.amber,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(
                15))), // Adds a gradient background and rounded corners to the container
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text('Total Program Lingkungan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      // fontFamily:
                      //     "monospace"
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$totalProgram',
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white)),
                    const Icon(
                      Icons.forest,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text('Program Mandatory',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white)),
                Text('$programMandatory',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white))
              ],
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text('Program Voluntary',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white)),
                Text('$programVoluntary',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white))
              ],
            )
          ],
        ),
      ),
    );
  }
}
