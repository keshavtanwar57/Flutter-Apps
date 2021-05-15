import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fulltimepass/main.dart';
import 'package:lottie/lottie.dart';
import 'constant.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Page { is_empty, not_empty }

class Vault extends StatefulWidget {
  @override
  _VaultState createState() => _VaultState();
}

List<String> task = [];

class _VaultState extends State<Vault> {
  TextEditingController idField = TextEditingController();
  final currentState = task.length == 0 ? Page.is_empty : Page.not_empty;

  Non_empty_screen(context) {
    return Container(
      color: Color(0xffFFFFFF),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Notes',
            style: TextStyle(
                fontFamily: 'VR',
                fontSize: 30,
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: task.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      child: Center(
                        child: ListTile(
                          tileColor: Color(0xffC5CAE9),
                          title: Text('${task[index]}'),
                          trailing: TextButton(
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                task.remove('${task[index]}');
                                save();
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  Widget addPass(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: (Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              textAlign: TextAlign.center,
              autofocus: true,
              controller: idField,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              child: Text('Done'),
              onPressed: () {
                addItemToList();
                idField.clear();
                save();

              },
            )
          ],
        ),
      )),
    );
  }

  void addItemToList() {
    setState(() {
      task.insert(0, idField.text);
    });
  }

  getvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      task = prefs.getStringList('stringList') ?? [];
    });

    return task;
  }

  @override
  void initState() {
    // TODO: implement initState
    print(getvalue());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }),
          backgroundColor: Color(0xFF5352ED),
          title: Text(
            "Vault",
            style: TextStyle(fontFamily: 'VR', color: Colors.white),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF5352ED),
          onPressed: () {
            showModalBottomSheet(context: context, builder: addPass);
          },
        ),
        body: task.isEmpty ? Empty_screen(context) : Non_empty_screen(context));
  }
}

save() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('stringList', task);
}

Empty_screen(context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      children: [
        LottieBuilder.network(
            'https://assets9.lottiefiles.com/packages/lf20_zvwoh26a.json'),
        Text(
          '      Your Vault is Empty  ' + '\n' + 'Add by clicking on + button',
          style: TextStyle(fontFamily: 'VR', fontSize: 20),
        )
      ],
    ),
  );
}
