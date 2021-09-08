import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class landingScreen extends StatefulWidget {
  @override
  _landingScreenState createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {

  final db = FirebaseFirestore.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String task;

  void _showDialog(bool isUpdate, DocumentSnapshot ds){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: isUpdate ? Text("Update todo") : Text("Add todo"),
            actions: [
              RaisedButton(onPressed: (){
                if(isUpdate){
                  db.collection("tasks").doc(ds.id).update({"task" : task,"time": DateTime.now()});
                }else{
                  db.collection("tasks").add({"task" : task,"time": DateTime.now()});

                }
                Navigator.pop(context);
              },
                child: Text('Add'),)
            ],
            content: Form(
              key: formkey,
              child: TextFormField(
                autovalidate: true,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Tasks",
                  border: OutlineInputBorder(),
                ),
                validator: (_val){
                  if(_val.isEmpty){
                    return "Cant be empty";
                  }
                  else{
                    return null;
                  }
                },
                onChanged: (_val){
                  task = _val;
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Firebase CRUD"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
        onPressed: (){
          _showDialog(false,null);
        },

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("tasks").orderBy("time").snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    child: ListTile(
                      title: Text(
                        ds['task']
                      ),
                      onTap: (){
                        //update tasks
                       // db.collection("tasks").doc(ds.id).update({"task" : "new value"});
                        _showDialog(true, ds);
                        
                      },
                      onLongPress: (){
                        //delete process
                        db.collection("tasks").doc(ds.id).delete();
                      },
                    ),
                  );
                });
          }else if(snapshot.hasError){
            return CircularProgressIndicator();
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
