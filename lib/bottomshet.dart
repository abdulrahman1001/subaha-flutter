import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivetrain/bind.dart';

class MyCustomBottomSheet extends StatefulWidget {
  @override
  _MyCustomBottomSheetState createState() => _MyCustomBottomSheetState();
}

class _MyCustomBottomSheetState extends State<MyCustomBottomSheet> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bind c = Get.find();
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'اذكر اسمك الكريم',
                
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                c.setname(_nameController.text);
                print('Name: ${_nameController.text}');
                Navigator.of(context).pop(); // Close the bottom sheet
              },
              child: Text('ارسل الاسم'),
            ),
          ],
        ),
      ),
    );
  }
}
//   @override
//   void dispose() {
//     _nameController
//         .dispose(); // Clean up the controller when the widget is disposed.
//     super.dispose();
//   }
// }
