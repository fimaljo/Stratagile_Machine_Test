import 'package:flutter/material.dart';
import 'package:stratagile_machine_test/core/constents.dart';
import 'package:stratagile_machine_test/widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODO",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return TodoCardWidget(
              title: "title", color: Constants.buttonGreyColor);
        },
      ),
    );
  }
}
