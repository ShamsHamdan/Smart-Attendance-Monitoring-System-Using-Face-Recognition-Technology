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

class EditCourseFormPage extends StatefulWidget {
  final String docId;
  final String courseId;
  const EditCourseFormPage(
      {super.key, required this.docId, required this.courseId});

  @override
  _EditCourseFormPageState createState() => _EditCourseFormPageState();
}

class _EditCourseFormPageState extends State<EditCourseFormPage> {
  String? urlnew;
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
  String _selectedFaculty = 'Faculty of Engineering and Information Technology';
  String _selectedSpecialty = 'Computer systems engineering Department';

  List<String> faculties = [
    'Faculty of Engineering and Information Technology',
    'Faculty of Arts',
    'Faculty of Law',
    'Faculty of Administrative and Financial Sciences',
    'Faculty of Allied Medical Sciences',
    'Faculty of Nursing',
    'Faculty of Sports Sciences',
    'Faculty of Medicine',
    'Faculty of Dentistry',
  ];

  List<String> specialties = [
    'Computer systems engineering Department',
    'Architecture Engineering Department',
    'Electrical Engineering Department',
    'Civil Engineering Department',
    'Computer Science Department',
    'Multimedia Technology Department',
    'Geographic Information Systems (GIS) Department',
  ];

  List<QueryDocumentSnapshot> data = [];
  String? oldtime;
  String? olddays;
  String? oldroom;
  String? oldname;
  String? oldcourseId;
  String? oldteacher;
  String? oldteacherId;
  String? oldsec;
  String? oldurl;
  String? oldfaculty;
  String? olddepartment;

  List<QueryDocumentSnapshot> docmainCourse = [];

  String? numOfDocMainCourse;

  Future getDataFromMain() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Courses')
        .where("idCourse", isEqualTo: oldcourseId)
        .get();
    docmainCourse.addAll(querySnapshot.docs);
    numOfDocMainCourse = docmainCourse[0].id as String?;
    setState(() {
      print("1111111111111111111111111$docmainCourse");
    });
  }

  Future getData() async {
    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.docId)
        .collection('courses')
        .doc(widget.courseId)
        .get();

    DocumentSnapshot dataofcourse = querySnapshott;
    oldtime = dataofcourse["time"];
    olddays = dataofcourse["date"];
    oldroom = dataofcourse["room"];
    oldname = dataofcourse["name"];
    oldcourseId = dataofcourse["idCourse"];
    oldteacher = dataofcourse["TeacherName"];
    oldteacherId = dataofcourse["TeacherId"];
    oldsec = dataofcourse["section"];
    oldurl = dataofcourse["url"];
    oldfaculty = dataofcourse["faculty"];
    olddepartment = dataofcourse["department"];

    setState(() {});
  }

  Future<void> updateCourseToTeacher(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.docId)
        .collection('courses')
        .doc(widget.courseId)
        .update({
      "name": _name.text,
      "idCourse": _courseId.text,
      "date": _date.text,
      "url": urlnew ?? oldurl,
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
        desc: 'Course updated successfully.',
        descTextStyle: TextStyle(fontSize: 17),
        btnOkText: "Ok",
        buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        btnOkOnPress: () {},
       ).show() .then((value) {
        Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                               ListofAddedCoursesForTeacher(categoryId: widget.docId,
                           
                          ),
                          transitionDuration: Duration.zero,
                        ),
                      );
      });
     

      print("=================================== course updated to teacher");
    }).catchError((error) => print(
            "=============================Failed to update course teachher: $error"));
  }

  Future<void> updateCourseToMain(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(numOfDocMainCourse)
        .update({
      "name": _name.text,
      "idCourse": _courseId.text,
      "date": _date.text,
      "url": urlnew ?? oldurl,
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
    }).catchError((error) {
      print(
          "=============================Failed to add course to main: $error");

      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              desc: 'Failed to update the course.',
              descTextStyle: TextStyle(fontSize: 17))
          .show();
    });
  }
  //TextEditingController dateTimeController = TextEditingController();

  @override
  void initState() {
    getData().then((_) {
      _name.text = oldname ?? '';
      _courseId.text = oldcourseId ?? '';
      _date.text = olddays ?? '';
      _teacherId.text = oldteacherId ?? '';
      _time.text = oldtime ?? '';
      _room.text = oldroom ?? '';
      _teacherName.text = oldteacher ?? '';
      _sec.text = oldsec ?? '';
      _selectedFaculty = oldfaculty ?? '';
      _selectedSpecialty = olddepartment ?? '';
      getDataFromMain();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Edit Course',
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
                builder: (context) => ListofAddedCoursesForTeacher(categoryId: widget.docId,)),
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
                              image: urlnew != null && urlnew!.isNotEmpty
                                  ? NetworkImage(Uri.parse(urlnew!).toString())
                                  : oldurl != null && oldurl!.isNotEmpty
                                      ? NetworkImage(
                                          Uri.parse(oldurl!).toString())
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
                            vertical: 15, horizontal: 20),
                        labelText: 'Course Name',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: .5,
                            ),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _courseId,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Course ID',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    // obscureText: true,
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _teacherId,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Teacher ID',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _time,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Time',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _date,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Date',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _room,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Room',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (val) {
                      if (val == "") {
                        return "Empty filed";
                      }
                    },
                    controller: _sec,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        labelText: 'Section Number',
                        labelStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: _selectedFaculty,
                    items: faculties.map((String faculty) {
                      return DropdownMenuItem<String>(
                        value: faculty,
                        child: Text(
                          faculty,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _selectedFaculty = value!;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        labelText: 'Faculty',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.grey[250],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: _selectedSpecialty,
                    items: specialties.map((String specialty) {
                      return DropdownMenuItem<String>(
                        value: specialty,
                        child: Text(
                          specialty,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      _selectedSpecialty = value!;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 5),
                        labelText: 'Specialty',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.grey[200],
                        filled: true,
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        try {
                          updateCourseToMain(context);
                          updateCourseToTeacher(context);
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
                      "Update",
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
        urlnew = await refstorge.getDownloadURL();
        print("aaaaaaaaaaaaaaaaaaaaa$urlnew");
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
