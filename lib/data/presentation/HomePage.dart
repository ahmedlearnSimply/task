// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task/data/cubit/task_cubit.dart';
import 'package:task/data/cubit/task_states.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  TextEditingController taskController = new TextEditingController();
  GlobalKey formKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Taskiti",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => TaskCubit(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Task Title',
                      hintText: 'Enter a task title',
                    ),
                  ),
                  Gap(20),
                  BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<TaskCubit>().addTask(
                                taskController.text,
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blueAccent, // Button background color
                          foregroundColor: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          elevation: 5, // Shadow elevation
                        ),
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      );
                    },
                  ),
                  Gap(20),
                  ListTile(
                    title: Text(taskController.text),
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_box_outline_blank_outlined,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
