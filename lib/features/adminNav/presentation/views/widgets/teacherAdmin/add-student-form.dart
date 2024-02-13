import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list-student-in-course.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddStudentForm extends StatefulWidget {
  final String courseDocId;
  final String teacherDocId;
  AddStudentForm(
      {super.key, required this.courseDocId, required this.teacherDocId});

  @override
  State<AddStudentForm> createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<AddStudentForm> {
  File? selectedImage;
  String? urlStudent;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _courseController = TextEditingController();

  String _selectedFaculty = 'Faculty of Engineering and Information Technology';

  String _selectedSpecialty = 'Computer systems engineering Department';

  String? Adminemail;
  String? Adminpass;
  String? idTeacher;
  String? WhichAdmin;
  int NumOfTeacher = 0;
  String? courseId;

  final List<String> faculties = [
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

  final List<String> specialties = [
    'Computer systems engineering Department',
    'Architecture Engineering Department',
    'Electrical Engineering Department',
    'Civil Engineering Department',
    'Computer Science Department',
    'Multimedia Technology Department',
    'Geographic Information Systems (GIS) Department',
  ];

  Future getData() async {
    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.teacherDocId)
        .collection('courses')
        .doc(widget.courseDocId)
        .get();

    DocumentSnapshot dataofcourse = querySnapshott;
    courseId = dataofcourse["idCourse"];
    setState(() {});
  }

  Future<void> addStudentToCourseInTeacher(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.teacherDocId)
        .collection('courses')
        .doc(widget.courseDocId)
        .collection('students')
        .add({
      "name": _nameController.text,
      "idStudent": _idController.text,
      "idCourse": _courseController.text,
      "url": urlStudent ?? '',
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
    }).then((value) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Success',
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              desc: 'Student added successfully.',
              descTextStyle: TextStyle(fontSize: 17),
               buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        btnOkText: "Ok",
        btnOkOnPress: () {},
      ).show()
      .then((value) { Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                               ListofAddedStudentForCourse(categoryId: widget.courseDocId,teacherDocId:widget.teacherDocId ,)
                          ),
                        ); });
          

      print("=================================== course Added to teacher");
    }).catchError((error) => print(
            "=============================Failed to add course teachher: $error"));
  }

  Future<void> addStudentToMain(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance.collection('Students').add({
      "name": _nameController.text,
      "idCourse": _courseController.text,
      "idStudent": _idController.text,
      "url": urlStudent ?? '',
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
      "Admin": FirebaseAuth.instance.currentUser!.uid
    }).then((value) {
      print("=================================== student Added to main");
    }).catchError((error) => print(
        "=============================Failed to add student to main: $error"));
  }
  //TextEditingController dateTimeController = TextEditingController();

  @override
  void initState() {
    getData().then((_) => _courseController.text = courseId as String);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Add Student',
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
                builder: (context) =>ListofAddedStudentForCourse(categoryId:widget.courseDocId, teacherDocId: widget.teacherDocId,)),
          );
          },
        ),
      ),
      resizeToAvoidBottomInset: false, // Disable resizing to avoid bottom inset
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Container(
                height: 200.0,
                color: Colors.grey[50],
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                showImagePickerOption(context);
                              },
                              child: CircleAvatar(
                                backgroundImage:
                                    urlStudent != null && urlStudent!.isNotEmpty
                                        ? NetworkImage(
                                            Uri.parse(urlStudent!).toString())
                                        : AssetImage(AssetsData.profilepic)
                                            as ImageProvider<Object>,
                                //   AssetImage(AssetsData.profilepic),
                                radius: 70,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: kPrimaryColor,
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
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
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: 'Full Name',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          fillColor: Colors.grey[250],
                          filled: true,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == "") {
                          return "Empty filed";
                        }
                      },
                      controller: _idController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: 'Student ID',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          fillColor: Colors.grey[250],
                          filled: true,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val == "") {
                          return "Empty filed";
                        }
                      },
                      controller: _courseController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                          labelText: 'Course Id',
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
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20),
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
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: 'Faculty',
                          //  hintStyle: TextStyle(fontSize: 18),
                          fillColor: Colors.grey[250],
                          filled: true,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(height: 20),
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
                          contentPadding: const EdgeInsets.only(left: 8),
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
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          try {
                            addStudentToCourseInTeacher(context);
                            addStudentToMain(context);
                          } catch (e) {
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("========err");
                        }
                    
                        // Navigator.pushNamed(context, "/homeadmin");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 80, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm(BuildContext context) {
    String name = _nameController.text;

    int id = int.tryParse(_idController.text) ?? 0;

    print('Name: $name');

    print('ID: $id');

    print('Faculty: $_selectedFaculty');
    print('Specialty: $_selectedSpecialty');

    Navigator.pop(context);
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
      var refstorge = FirebaseStorage.instance.ref("Teachers").child(imageName);
      if (await selectedImage!.exists()) {
        await refstorge.putFile(selectedImage!);
        urlStudent = await refstorge.getDownloadURL();
        print("aaaaaaaaaaaaaaaaaaaaa$urlStudent");
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
}
