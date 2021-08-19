import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

TextEditingController Movie_Name = TextEditingController();
TextEditingController Director_Name = TextEditingController();

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  Box<String> MoviesBox;

  @override
  void initState() {
    super.initState();
    MoviesBox = Hive.box<String>("Movies");
  }

  String ImageString;
  File _Image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Movie_Name.text != null &&
              Director_Name.text != null &&
              ImageString != null) {
            String key = Movie_Name.text + "@" + Director_Name.text;
            String value = ImageString;
            MoviesBox.put(key, value);
            Navigator.pop(context);
            Movie_Name.clear();
            Director_Name.clear();
          } else {
            print('error');
          }
        },
        child: Icon(Icons.check_rounded),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Movie',
          style: GoogleFonts.mPlusRounded1c(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _Image == null
                      ? Container(
                          height: 300,
                          width: 250,
                          color: Colors.blueGrey,
                          child: FlatButton.icon(
                              onPressed: () async {
                                var image = await ImagePicker.pickImage(
                                    source: ImageSource.gallery);
                                if (image == null) return null;
                                ImageString =
                                    base64Encode(image.readAsBytesSync());
                                setState(() {
                                  _Image = image;
                                });
                              },
                              icon: Icon(Icons.photo),
                              label: Text('select image')))
                      : Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(child: Image.file(_Image)),
                        )),
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
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  controller: Movie_Name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  controller: Director_Name,
                  decoration: InputDecoration(
                    labelText: 'Add Name',
                    border: OutlineInputBorder(),
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
