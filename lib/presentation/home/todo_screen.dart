import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stratagile_machine_test/application/home/local_db_provider.dart';
import 'package:stratagile_machine_test/domain/home/model/todo_model.dart';

import '../../core/constents.dart';
import '../../widgets/input_field.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, this.id, this.isUpdate = false});
  final int? id;
  final bool isUpdate;
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late LocalDBProvider _provider;
  @override
  void initState() {
    super.initState();
    _provider = Provider.of(context, listen: false);

    if (widget.id == null) {
      _titleController = TextEditingController();
      _descriptionController = TextEditingController();
    } else {
      TodoModel obj =
          _provider.todoList.firstWhere((element) => element.id == widget.id);
      _titleController = TextEditingController(text: obj.title);
      _descriptionController = TextEditingController(text: obj.discription);
    }
  }

  saveData() async {
    await _provider.insertData(
      _titleController.text,
      _descriptionController.text,
    );
    await _provider.readData();
    if (!mounted) return;
    Navigator.pop(context);
  }

  updateData() async {
    await _provider.updateData(
        _titleController.text, _descriptionController.text, widget.id!);
    await _provider.readData();
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isUpdate ? "Update" : "Create",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  nameController: _titleController,
                  heading: "Title",
                  height: 50,
                  radius: 10,
                  validationMessage: "Enter title",
                ),
                InputField(
                  nameController: _descriptionController,
                  heading: "Description",
                  height: 150,
                  validationMessage: "Enter Description",
                ),
                widget.id == null
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(126, 37, 150, 190),
                          fixedSize: Size(size.width * 0.4, 50),
                        ),
                        onPressed: () {
                          if (_titleController.text.isNotEmpty &&
                              _descriptionController.text.isNotEmpty) {
                            saveData();
                            Constants.showSnackBar(
                                "TODO Created", Colors.green);
                          } else {
                            Constants.showSnackBar("Fill All Data", Colors.red);
                          }
                        },
                        child: Text(
                          'Create',
                          style: Constants.poppinsFont.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(126, 37, 150, 190),
                          fixedSize: Size(size.width * 0.4, 50),
                        ),
                        onPressed: () {
                          if (_titleController.text.isNotEmpty &&
                              _descriptionController.text.isNotEmpty) {
                            updateData();
                            Constants.showSnackBar(
                                "Updated The Todo", Colors.green);
                          } else {
                            Constants.showSnackBar("Fill All Data", Colors.red);
                          }
                        },
                        child: Text(
                          'Update',
                          style: Constants.poppinsFont.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                Constants.sizeH30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
