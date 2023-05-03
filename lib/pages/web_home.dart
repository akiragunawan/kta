import "package:flutter/material.dart";

class web_home extends StatelessWidget {
  const web_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 130,
            height: 130,
            child: Text('wellow'),
          )
        ],
      ),
    );
  }
}
