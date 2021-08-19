import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'updatemovie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Addmovies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<String> MoviesBox;
  @override
  void initState() {
    super.initState();
    MoviesBox = Hive.box<String>("Movies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.mPlusRounded1c(fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMovie()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: MoviesBox.listenable(),
          builder: (BuildContext context, Box<String> MoviesBox, _) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final key = MoviesBox.keys.toList()[index];
                  final value = MoviesBox.get(key);
                  Image SavedImage = Image.memory(
                    base64Decode(value),
                    fit: BoxFit.fill,
                  );

                  String MovieName = key.toString().split('@')[0];
                  String DirectorName = key.toString().split('@')[1];

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(8),
                            height: 230,
                            child: SavedImage,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  MovieName,
                                  //overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: GoogleFonts.mPlusRounded1c(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                    child: Text(
                                  ' ~ $DirectorName',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  softWrap: false,
                                  style: GoogleFonts.mPlusRounded1c(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    MoviesBox.deleteAt(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setInt('IndexPassed', index);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateMovie()),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: MoviesBox.keys.toList().length);
          },
        ),
      ),
    );
  }
}
