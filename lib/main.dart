import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(primaryColor: Colors.green),
        home: HomeActivity()
    );
  }
}
//----------------------------------------------

MySnackbar(message,context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
  );
}

//-----------------------------------------------

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  //-------------------------------------------------------

  MyAlertDialog(message,context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(child: AlertDialog(
            title: Text ("Alert !"),
            content: Text("Do You want to Exit"),
            actions: [
              TextButton(onPressed: (){
                MySnackbar("Exit Success", context);
              }, child: Text("Yes")),
              TextButton(onPressed: (){
                Navigator.of(context).pop();}, child: Text("No")),
            ],
          ));
        }
    );
  }
  //-------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity,60)
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Inventory App"),
        titleSpacing:20,
        toolbarHeight: 60,
        actions: [
          IconButton(onPressed: (){MySnackbar("I am Comments", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackbar("I am Search", context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MySnackbar("I am Settings", context);}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){MySnackbar("I am Email", context);}, icon: Icon(Icons.email))
        ],
      ),

      //-----------------------------------------------------------

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(
                labelText: 'First Name')),),
          Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(
              labelText: 'Last Name')),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(
                labelText: 'Email Address')),),
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton (onPressed: (){},child: Text('Submit')),)
        ],
      ),

      //------------------------------------------------------

      floatingActionButton: FloatingActionButton(
        elevation: 18,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: (){
          MySnackbar("I am Floating Action Button", context);
        },
      ) ,
//-----------------------------------------------------


    );
  }
}


