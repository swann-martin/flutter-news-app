import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Swann Martin"),
      ),
      body: Column(
        children: [
          Image.network('https://avatars.githubusercontent.com/u/71760899?v=4'),
          const SizedBox(
            height: 12,
          ),
          const Text('Swann Martin', style: TextStyle(fontSize: 28)),
          const Text('swannmartin@swannmartin.xyz',
              style: TextStyle(fontSize: 16)),
        ],
      ));
}
