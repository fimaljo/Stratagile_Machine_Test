import 'package:flutter/material.dart';
import 'package:stratagile_machine_test/domain/home/todo_model.dart';

import '../core/constents.dart';

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget(
      {super.key,
      required this.title,
      // required this.datas,
      required this.color});
  final String title;

  // final TodoModel datas;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: const Color.fromARGB(53, 0, 0, 0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: color),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/goal (1).png",
                      height: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 20,
                child: Text(
                  title,
                  style: Constants.poppinsFont.copyWith(
                      color: Constants.scaffoldColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              IconButton(
                  onPressed: () {
                    // provider.delete(datas.id);
                    // provider.readData();
                    // provider.readDetailsData();
                  },
                  icon: const Icon(Icons.delete_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
