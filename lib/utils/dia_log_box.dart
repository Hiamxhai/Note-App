import 'package:flutter/material.dart';
import 'package:to_do/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCacel;
   DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCacel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
              hintText: 'Add a new task'
            ),
          ),
          //buttons -> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //save button 
              MyButton(
                  text: "Save",
                  onPress: (){
                    onSave();
                  }
               ),
              SizedBox(width: 8,),
              //cancel button
              MyButton(
                  text: "Cancel",
                  onPress: (){
                    onCacel();
                  }
              ),
            ],
          )
        ],
      ),
      ),
    );
  }
}
