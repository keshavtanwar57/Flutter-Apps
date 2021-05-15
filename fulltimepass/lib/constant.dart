import 'package:flutter/material.dart';
import 'vault.dart';

const kHeadingStyle = TextStyle(
  fontSize: 30,
  fontFamily: 'VR',
  color: Colors.white,
);

class MyButton extends StatelessWidget {
  String txt;
  String path;
  Color color;
  MyButton({this.txt, this.path, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          txt,
          style: TextStyle(fontSize: 30, color: color),
        ),
      ),
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}

class Id_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Id()],
    );
  }
}

class Id extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Password'),
      trailing: Icon(Icons.delete),
    );
  }
}
