import 'package:e_commerce_rep/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_rep/model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          //  final email = user.email;
          final phone = user.phone;
          final color = user.gender == 'male' ? Colors.red : Colors.blue;
          return ListTile(
            leading: Text("${index + 1}"),
            title: Text(user.fullName),
            subtitle: Text(phone),
            tileColor: color,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userData();
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }

  Future<void> userData() async {
    final response = await UserAPI.userData();

    setState(() {
      users = response;
    });
  }
}
