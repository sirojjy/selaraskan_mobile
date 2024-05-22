import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Column(
            children: [
              Icon(Icons.cleaning_services),
              Text('Kebersihan Pelabuhan')
            ],
          )
        ],
      ),
    );
  }
}
