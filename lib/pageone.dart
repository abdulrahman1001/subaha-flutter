import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivetrain/bind.dart';
import 'package:hivetrain/bottomshet.dart';

class Pageone extends GetView<bind> {
  // Ensure the class name 'Bind' matches your controller
  Pageone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مسبحتك في جيبك', style: TextStyle(fontSize: 30)),
        actions: [
          MaterialButton(color: Colors.red,child: Text('أضف اسمك', style: TextStyle(fontSize: 30)),onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  return MyCustomBottomSheet();
                });
          })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<bind>(
                builder: (controller) {
                  return Column(
                    children: [
                      Text('${controller.name}',
                          style: TextStyle(
                              fontSize: 100)), // Assuming name is an Rx<Type>
                      Text('${controller.counter.value}',
                          style: TextStyle(
                              fontSize:
                                  150)), // Assuming counter is an Rx<Type>
                    ],
                  );
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.orange,
                    onPressed: () {
                      controller.reset();
                    },
                    child: Text('صفر العداد', style: TextStyle(fontSize: 70)),
                  ),
                  SizedBox(width: 30),
                  MaterialButton(
                    color: Colors.orange,
                    onPressed: () {
                      controller.increse();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text('++', style: TextStyle(fontSize: 60)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
