import 'package:flutter/material.dart';

void main() => runApp(ShoppingList());

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}


class _ShoppingListState extends State<ShoppingList> {
  bool showDialog = false;
  List<String> shoppingList = [];
  List<bool> checkBoxList = [];
  TextEditingController eCtrl = new TextEditingController(); // Controler for the text box
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // App Bar Begin -- Top of app
        appBar: AppBar(
          title: Text('Shopping List App'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {
              setState(() {
                showDialog = true;
                });
              },
            ),
            IconButton(icon: Icon(Icons.remove), onPressed: () {
              int counter = 0;
              while(counter < shoppingList.length){
                if(checkBoxList[counter] == true){
                  checkBoxList.removeAt(counter);
                  shoppingList.removeAt(counter);
                  counter = 0;
                } else {
                  counter++;
                }
                
              }
              setState(() {
              });
            },)
          ],
          ), // End of appBar
        body: Column(
          children: <Widget>[
            // Build this text widget first as a place holder
            Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),),
            Text('Our Shopping List', style: TextStyle(fontSize: 30),), 

            /* Show Note: If Show Dialog is true show the dialog box -- if it's false remove it 
            This will need a showDialog variable which will need to be created up above */
            showDialog == true ? 
            AlertDialog(
              title: Text("Add Item"),
              content: TextField(
                controller: eCtrl,
                decoration: InputDecoration.collapsed(hintText: 'Add your item'),
                maxLines: 3,
                onSubmitted: (String text) {},
              ),  
              actions: <Widget>[
                RaisedButton(onPressed: () {
                  setState(() {
                    showDialog = false;
                    shoppingList.add(eCtrl.text);
                    checkBoxList.add(false);
                    print(eCtrl.text);
                    eCtrl.clear();
                  });
                },
                child: Text('Ok'),)
              ],
            ) : Text(''),
            Flexible(
              child: ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder:(BuildContext context, int index){
                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: checkBoxList[index],
                      onChanged: (bool newValue){
                        checkBoxList[index] = newValue;
                        setState(() {
                          
                        });
                      },
                    ),
                    Text(shoppingList[index])
                  ],
                );
              } 
              ,)
            )
            ],
        ),
      ),
    );
  }
}