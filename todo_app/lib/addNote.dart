import 'package:flutter/material.dart';
import 'landingPage.dart';

class addNote extends StatefulWidget {
  @override
  _addNoteState createState() => _addNoteState();
}

class _addNoteState extends State<addNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
          FlatButton(
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                ),
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter Content',
                  ),
                ),
              ),
             
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
