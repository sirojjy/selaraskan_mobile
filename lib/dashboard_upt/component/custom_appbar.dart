import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements  PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: Text(
        "Pelabuhan Perikanan Nusantara Palabuhanratu",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
            icon: Icon(Icons.add_alert_rounded))
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
