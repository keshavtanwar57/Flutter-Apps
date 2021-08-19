import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

TextEditingController Movie_Name;
TextEditingController Director_Name;

String DefaultMovieName;
String DefaultDirectorName;
String DefaultImageString;

class UpdateMovie extends StatefulWidget {
  @override
  _UpdateMovieState createState() => _UpdateMovieState();
}

class _UpdateMovieState extends State<UpdateMovie> {
  int Index;
  Box<String> MoviesBox;
  String Value_Movie_Name;
  String Director_Movie_Name;
  @override
  void initState() {
    super.initState();
    MoviesBox = Hive.box<String>("Movies");
    getData();
  }

  String ImageString;
  File _Image;
  Image SavedImage;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt('IndexPassed');
    setState(() {
      Index = index;
      final key = MoviesBox.keys.toList()[Index];

      final value = MoviesBox.get(key);
      SavedImage = Image.memory(
        base64Decode(value),
        fit: BoxFit.fill,
      );
      Value_Movie_Name = key.toString().split('@')[0];
      Director_Movie_Name = key.toString().split('@')[1];
      DefaultMovieName = Value_Movie_Name;
      DefaultDirectorName = Director_Movie_Name;
      DefaultImageString = value;
      Movie_Name = TextEditingController(text: Value_Movie_Name);
      Director_Name = TextEditingController(text: Director_Movie_Name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Update',
          style: GoogleFonts.mPlusRounded1c(fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String oldKey = DefaultMovieName + "@" + DefaultDirectorName;
          Movie_Name.text != null ? DefaultMovieName = Movie_Name.text : null;
          Director_Name.text != null
              ? DefaultDirectorName = Director_Name.text
              : null;
          ImageString != null ? DefaultImageString = ImageString : null;
          if (DefaultMovieName != null &&
              DefaultDirectorName != null &&
              DefaultImageString != null) {
            String key = DefaultMovieName + "@" + DefaultDirectorName;
            String value = DefaultImageString;
            if (oldKey != key) {
              MoviesBox.delete(oldKey);
            }

            MoviesBox.put(key, value);
            Navigator.pop(context);
            Movie_Name.clear();
            Director_Name.clear();
          } else {
            print('error');
          }
        },
        child: Icon(
          Icons.check_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 240, child: SavedImage),
              ),
              IconButton(
                  onPressed: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (image == null) return null;
                    ImageString = base64Encode(image.readAsBytesSync());
                    setState(() {
                      _Image = image;
                      SavedImage = Image.file(_Image);
                    });
                  },
                  icon: Icon(Icons.edit)),
              SizedBox(
                height: 30,
              ),
              Text(
                'Movie Name',
                style: GoogleFonts.mPlusRounded1c(fontSize: 20),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Expanded(
                    child: TextField(
                  textAlign: TextAlign.center,
                  controller: Movie_Name,
                  decoration: InputDecoration(
                    labelText: 'Add Title',
                  ),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Director Name',
                style: GoogleFonts.mPlusRounded1c(fontSize: 20),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Expanded(
                    child: TextField(
                  textAlign: TextAlign.center,
                  controller: Director_Name,
                  decoration: InputDecoration(
                    labelText: 'Add Name',
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
