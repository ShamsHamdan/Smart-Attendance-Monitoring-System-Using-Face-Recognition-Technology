import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditProfessorForm extends StatefulWidget {
  final String teacherDocId;
  EditProfessorForm({super.key, required this.teacherDocId});

  @override
  State<EditProfessorForm> createState() => _EditProfessorFormState();
}

class _EditProfessorFormState extends State<EditProfessorForm> {
  File? selectedImage;
  String? urlTeacher;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

  String _selectedFaculty = 'Faculty of Engineering and Information Technology';

  String _selectedSpecialty = 'Computer systems engineering Department';

  String? Adminemail;
  String? Adminpass;
  String? idTeacher;
  String? WhichAdmin;
  int NumOfTeacher = 0;

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

  String? oldname;
  String? oldId;
  String? oldfaculty;
  String? olddepartment;
  String? oldurl;

  Future getData() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.teacherDocId)
        .get();
    DocumentSnapshot data1 = querySnapshot;
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
      oldname = data1["name"];
      oldId = data1["id"];
      oldfaculty = data1["faculty"];
      olddepartment = data1["department"];
      oldurl = data1["url"];
    });
  }

  Future<void> updateTeacher(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.teacherDocId)
        .update({
      "name": _nameController.text,
      "id": _idController.text,
      //"idFire": idTeacher ?? '',
      "url": urlTeacher ?? oldurl,
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
      // "Admin": WhichAdmin ?? '',
    }).then((value) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Success',
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              desc: 'Teacher updated successfully.',
              descTextStyle: TextStyle(fontSize: 17),
              buttonsTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        btnOkText: "Ok",
        btnOkOnPress: () {},
      ).show()
      .then((value) { Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AddTeacherandCourseInAdminTabNav(
                              initialIndex: 1,
                            ),
                          ),
                        ); });



      print("=================================== teacher updated");
    }).catchError((error) {
      print(
          "=============================Failed to update the teacher: $error");
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              desc: 'Failed to update the teacher.',
              descTextStyle: TextStyle(fontSize: 17))
          .show();
    });
  }

  @override
  void initState() {
    getData().then((_) {
      _nameController.text = oldname ?? '';
      _idController.text = oldId ?? '';
      _selectedFaculty = oldfaculty ?? '';
      _selectedSpecialty = olddepartment ?? '';
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Edit Teacher',
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
                            builder: (context) =>
                                const AddTeacherandCourseInAdminTabNav(
                              initialIndex: 1,
                            ),
                          ),
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
                                backgroundImage: urlTeacher != null &&
                                        urlTeacher!.isNotEmpty
                                    ? NetworkImage(
                                        Uri.parse(urlTeacher!).toString())
                                    : oldurl != null && oldurl!.isNotEmpty
                                        ? NetworkImage(
                                            Uri.parse(oldurl!).toString())
                                        : AssetImage(
                                                AssetsData.profilepic)
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          labelText: 'Full Name',
                          labelStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          fillColor: Colors.grey[200],
                          filled: true,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    // const SizedBox(height: 30),
                    // TextFormField(
                    //   validator: (val) {
                    //     if (val == "") {
                    //       return "Empty filed";
                    //     }
                    //   },
                    //   controller: _emailController,
                    //   decoration: InputDecoration(
                    //       contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    //       labelText: 'Email',
                    //       labelStyle: const TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //       fillColor: Colors.grey[250],
                    //       filled: true,
                    //       errorBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.red),
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(width: .5),
                    //           borderRadius: BorderRadius.circular(10.0))),
                    // ),
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          labelText: 'ID',
                          labelStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          fillColor: Colors.grey[200],
                          filled: true,
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    // const SizedBox(height: 30),
                    // TextFormField(
                    //   obscureText: true,
                    //   validator: (val) {
                    //     if (val == "") {
                    //       return "Empty filed";
                    //     }
                    //   },
                    //   controller: _passwordController,
                    //   decoration: InputDecoration(
                    //      contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    //       labelText: 'Password',
                    //       labelStyle: const TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //       fillColor: Colors.grey[250],
                    //       filled: true,
                    //       errorBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.red),
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(width: .5),
                    //           borderRadius: BorderRadius.circular(10.0))),
                    // ),
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
                              vertical: 17, horizontal: 5),
                          labelText: 'Faculty',
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          //  hintStyle: TextStyle(fontSize: 18),
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
                              vertical: 17, horizontal: 5),
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
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          try {
                            updateTeacher(context);
                            //   final credential = await FirebaseAuth.instance
                            //       .createUserWithEmailAndPassword(
                            //     email: _emailController.text,
                            //     password: _passwordController.text,
                            //   );
                            //   idTeacher = FirebaseAuth.instance.currentUser!.uid;
                            //   await FirebaseAuth.instance.signOut();
                            //   final credentiall = await FirebaseAuth.instance
                            //       .signInWithEmailAndPassword(
                            //           email: Adminemail!, password: Adminpass!);
                            //   WhichAdmin = FirebaseAuth.instance.currentUser!.uid;
                            //   addTeacher(context);
                            //   NumOfTeacher = NumOfTeacher! + 1;
                            //   // FirebaseFirestore.instance
                            //   //     .collection('Admins')
                            //   //     .add({'name': username.text,
                            //   //   'email': email.text,});
                            //   //  String uid = userCredential.user.uid;
                            //   // await admins.add({
                            //   //   'name': username,
                            //   //   'email': email,
                            //   // });
                            // } on FirebaseAuthException catch (e) {
                            //   if (e.code == 'weak-password') {
                            //     AwesomeDialog(
                            //             context: context,
                            //             dialogType: DialogType.error,
                            //             animType: AnimType.rightSlide,
                            //             title: 'Error',
                            //             titleTextStyle: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 22),
                            //             desc:
                            //                 'The password provided is too weak.',
                            //             descTextStyle: TextStyle(fontSize: 17))
                            //         .show();
                            //     print('The password provided is too weak.');
                            //   } else if (e.code == 'email-already-in-use') {
                            //     print(
                            //         'The account already exists for that email.');
                            //     AwesomeDialog(
                            //             context: context,
                            //             dialogType: DialogType.error,
                            //             animType: AnimType.rightSlide,
                            //             title: 'Error',
                            //             titleTextStyle: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 22),
                            //             desc:
                            //                 'The account already exists for that email.',
                            //             descTextStyle: TextStyle(fontSize: 17))
                            //         .show();
                            //   }
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
                            EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27))),
                      ),
                      child: const Text(
                        "Update",
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
    String email = _emailController.text;
    String pass = _passwordController.text;
    int id = int.tryParse(_idController.text) ?? 0;

    print('Name: $name');
    print('Email: $email');

    print('ID: $id');
    print('pass: $pass');
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
        urlTeacher = await refstorge.getDownloadURL();
        print("aaaaaaaaaaaaaaaaaaaaa$urlTeacher");
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
