import 'package:flutter/material.dart';
import 'package:stratagile_machine_test/application/home/local_db_provider.dart';
import 'package:provider/provider.dart';
import 'package:stratagile_machine_test/core/constents.dart';
import 'package:stratagile_machine_test/domain/home/model/todo_model.dart';
import 'package:stratagile_machine_test/presentation/home/todo_screen.dart';
import 'package:stratagile_machine_test/widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LocalDBProvider provider;
  @override
  void initState() {
    provider = Provider.of<LocalDBProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.readData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODO",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const TodoScreen();
            },
          ));
        },
      ),
      body: Consumer<LocalDBProvider>(
        builder: (context, value, child) => value.todoList.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/cloud.png",
                      height: 200,
                    ),
                    Text(
                      "Create Todo",
                      style: Constants.poppinsFont.copyWith(
                          color: Constants.scaffoldColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: value.todoList.length,
                itemBuilder: (context, index) {
                  TodoModel datas = value.todoList[index];
                  return TodoCardWidget(
                      title: datas.title,
                      datas: datas,
                      color: Constants.buttonGreyColor);
                },
              ),
      ),
    );
  }
}
