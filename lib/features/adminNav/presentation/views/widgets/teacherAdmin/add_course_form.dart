import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add-student-form.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/listCoursesOfEachTeacher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:path/path.dart';

class AddCourseFormPage extends StatefulWidget {
  final String docId;
  const AddCourseFormPage({super.key, required this.docId});

  @override
  _AddCourseFormPageState createState() => _AddCourseFormPageState();
}

class _AddCourseFormPageState extends State<AddCourseFormPage> {
  String? urlCourse;
  String courseName = '';
  String identity = '';
  String selectedFaculty = '';
  String selectedSpecialization = '';
  String doctorName = '';
  Uint8List? _image;
  File? selectedImage;
  // DateTime? selectedDateTime;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _courseId = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _teacherId = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _room = TextEditingController();
  final TextEditingController _teacherName = TextEditingController();
  final TextEditingController _sec = TextEditingController();
  String _selectedFaculty = 'Faculty of Engineering';
  String _selectedSpecialty = 'Computer Systems Engineering Department';

  String? teacherId;
  String? nameTeacher;

  List<String> faculties = [
    'Faculty of Engineering',
    'Faculty of Arts',
    'Faculty of Law',
    'Faculty of Information Technology',
    'Faculty of Allied Medical Sciences',
    'Faculty of Nursing',
    'Faculty of Sports Sciences',
    'Faculty of Medicine',
    'Faculty of Dentistry',
  ];

  List<String> specialties = [
    'Computer Systems Engineering Department',
    'Architecture Engineering Department',
    'Electrical Engineering Department',
    'Civil Engineering Department',
  ];

  Future getData() async {
    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.docId)
        .get();

    DocumentSnapshot dataofTeacher = querySnapshott;
    teacherId = dataofTeacher["id"];
    nameTeacher = dataofTeacher['name'];
    setState(() {});
  }

  @override
  void initState() {
    getData().then((_) {
      _teacherName.text = nameTeacher as String;
      _teacherId.text = teacherId as String;
    });

    // TODO: implement initState
    super.initState();
  }

  Future<void> addCourseToTeacher(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.docId)
        .collection('courses')
        .add({
      "name": _name.text,
      "idCourse": _courseId.text,
      "date": _date.text,
      "url": urlCourse ?? '',
      "time": _time.text,
      "room": _room.text,
      "TeacherId": _teacherId.text,
      "TeacherName": _teacherName.text,
      "section": _sec.text,
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
    }).then((value) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success',
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        desc: 'Course added successfully.',
        descTextStyle: TextStyle(fontSize: 17),
        btnOkText: "Ok",
        buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        btnOkOnPress: () {},
      ).show().then((value) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                ListofAddedCoursesForTeacher(
              categoryId: widget.docId,
            ),
            transitionDuration: Duration.zero,
          ),
        );
      });

      print("=================================== course Added to teacher");
    }).catchError((error) => print(
            "=============================Failed to add course teachher: $error"));
  }

  Future<void> addCourseToMain(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance.collection('Courses').add({
      "name": _name.text,
      "idCourse": _courseId.text,
      "date": _date.text,
      "url": urlCourse ?? '',
      "time": _time.text,
      "room": _room.text,
      "TeacherId": _teacherId.text,
      "TeacherName": _teacherName.text,
      "section": _sec.text,
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
      "Admin": FirebaseAuth.instance.currentUser!.uid
    }).then((value) {
      // AwesomeDialog(
      //         context: context,
      //         dialogType: DialogType.success,
      //         animType: AnimType.rightSlide,
      //         title: 'Success',
      //         titleTextStyle:
      //             TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      //         desc: 'Course added successfully.',
      //         descTextStyle: TextStyle(fontSize: 17))
      //     .show();

      print("=================================== course Added to main");
    }).catchError((error) => print(
        "=============================Failed to add course to main: $error"));
  }
  //TextEditingController dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Add Course',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ListofAddedCoursesForTeacher(
                          categoryId: widget.docId,
                        )),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(7.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: new Stack(fit: StackFit.loose, children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        showImagePickerOption(context);
                      },
                      child: new Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: urlCourse != null && urlCourse!.isNotEmpty
                                  ? NetworkImage(
                                      Uri.parse(urlCourse!).toString())
                                  : AssetImage(AssetsData.imageAddCourseDef)
                                      as ImageProvider<Object>,
                              //AssetImage('assets/images/camAddcourse.jpg'),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 90.0, right: 100.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 25.0,
                          child: new Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ]),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _name,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Course Name',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _courseId,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Course ID',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _teacherName,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Teacher Name',
                        labelStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    // obscureText: true,
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _teacherId,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        labelText: 'Teacher ID',
                        labelStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _time,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Time',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _date,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Days',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _room,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Room',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _sec,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Section Number',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonFormField<String>(
                    value: _selectedFaculty,
                    items: faculties.map((String faculty) {
                      return DropdownMenuItem<String>(
                        value: faculty,
                        child: Text(
                          faculty,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _selectedFaculty = value!;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Faculty',
                        //  hintStyle: TextStyle(fontSize: 18),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 25),
                  DropdownButtonFormField<String>(
                 // padding: EdgeInsets.only(right: 10),
                    value: _selectedSpecialty,
                    items: specialties.map((String specialty) {
                      return DropdownMenuItem<String>(
                        value: specialty,
                        child: Text(
                          specialty,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _selectedSpecialty = value!;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        hintText: 'Specialty',
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        try {
                          addCourseToTeacher(context);
                          addCourseToMain(context);
                        } catch (error) {
                          print("$error");
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 70, vertical: 7)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  //const SizedBox(height: 16),
                  //         Padding(
                  //           padding: EdgeInsets.all(15),
                  //           child: ElevatedButton(
                  //             onPressed: () {
                  //              // AddStudentForm()
                  //               Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //          AddStudentForm() ),
                  // );
                  //             },
                  //             style: ButtonStyle(
                  //               //  minimumSize: MaterialStateProperty.all(Size(double.minPositive, 7)),
                  //               backgroundColor:
                  //                   MaterialStateProperty.all(kPrimaryColor),
                  //               padding: MaterialStateProperty.all(
                  //                   EdgeInsets.symmetric(horizontal: 1, vertical: 7)),
                  //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(27))),
                  //             ),
                  //             child: Text(
                  //               "Add Students",
                  //               style: TextStyle(fontSize: 24, color: Colors.white),
                  //             ),
                  //           ),
                  //         ),
                ],
              ),
            ),
          ]),
        )));
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          child: InkWell(
            onTap: () {
              _pickImageFromGallery();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.photo,
                  size: 70,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    var imageName = basename(returnImage!.path);
    if (returnImage != null) {
      selectedImage = File(returnImage.path);
      var refstorge = FirebaseStorage.instance.ref("Course").child(imageName);
      if (await selectedImage!.exists()) {
        await refstorge.putFile(selectedImage!);
        urlCourse = await refstorge.getDownloadURL();
        print("aaaaaaaaaaaaaaaaaaaaa$urlCourse");
      } else {
        print("Selected image file does not exist.");
        // Handle the error or display a message to the user.
      }
      //   refstorge.putFile(selectedImage!);
      //  urlAdmin =await  refstorge.getDownloadURL();
    }
    if (mounted) {
      setState(() {});
    } else
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrr");
    // _image = File(returnImage.path).readAsBytesSync();
  }

  // void _selectDateTime(BuildContext context) async {
  //   DateTime now = DateTime.now();
  //   DateTime startInitialDate = now.subtract(Duration(days: now.weekday - 1)); // Monday
  //   DateTime endInitialDate = startInitialDate.add(const Duration(days: 2)); // Wednesday

  //   List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
  //     context: context,
  //     startInitialDate: startInitialDate,
  //     startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
  //     startLastDate: DateTime.now().add(
  //       const Duration(days: 3652),
  //     ),
  //     endInitialDate: endInitialDate,
  //     endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
  //     endLastDate: DateTime.now().add(
  //       const Duration(days: 3652),
  //     ),
  //     is24HourMode: false,
  //     isShowSeconds: false,
  //     minutesInterval: 1,
  //     secondsInterval: 1,
  //     borderRadius: const BorderRadius.all(Radius.circular(16)),
  //     constraints: const BoxConstraints(
  //       maxWidth: 350,
  //       maxHeight: 650,
  //     ),
  //     transitionBuilder: (context, anim1, anim2, child) {
  //       return FadeTransition(
  //         opacity: anim1.drive(
  //           Tween(
  //             begin: 0,
  //             end: 1,
  //           ),
  //         ),
  //         child: child,
  //       );
  //     },
  //     transitionDuration: const Duration(milliseconds: 200),
  //     barrierDismissible: true,
  //     selectableDayPredicate: (dateTime) {
  //       // Enable only Monday and Wednesday
  //       return dateTime.weekday == DateTime.monday || dateTime.weekday == DateTime.wednesday;
  //     },
  //   );

  //   if (dateTimeList != null && dateTimeList.isNotEmpty) {
  //     setState(() {
  //       selectedDateTime = dateTimeList[0];
  //       dateTimeController.text =
  //           DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime!);
  //     });
  //   }
  // }
}
