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

class AddProfessorForm extends StatefulWidget {
  AddProfessorForm({super.key});

  @override
  State<AddProfessorForm> createState() => _AddProfessorFormState();
}

class _AddProfessorFormState extends State<AddProfessorForm> {
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
  User? userTeacher;

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
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admins')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    DocumentSnapshot data1 = querySnapshot.docs[0];
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
      Adminemail = data1['email'];
      Adminpass = data1['password'];
    });
  }

  Future<void> addTeacher(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance.collection('Teachers').add({
      "name": _nameController.text,
      "email": _emailController.text,
      "id": _idController.text,
      "idFire": idTeacher ?? '',
      "url": urlTeacher ?? '',
      "faculty": _selectedFaculty,
      "department": _selectedSpecialty,
      "Admin": WhichAdmin ?? '',
    }).then((value) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success',
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        desc: 'Teacher added successfully.',
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

      print("=================================== teacher Added");
    }).catchError((error) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Failed',
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              desc: 'Failed to add teacher.',
              descTextStyle: TextStyle(fontSize: 17))
          .show();
      print("=============================Failed to add teacher: $error");
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Add Teacher',
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
                builder: (context) =>AddTeacherandCourseInAdminTabNav(initialIndex: 1,)),
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
                                    urlTeacher != null && urlTeacher!.isNotEmpty
                                        ? NetworkImage(
                                            Uri.parse(urlTeacher!).toString())
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
                          fillColor: Colors.grey[200],
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
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: 'Email',
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
                          hintText: 'ID',
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
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        if (val == "") {
                          return "Empty filed";
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: 'Password',
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
                          fillColor: Colors.grey[200],
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
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            idTeacher = FirebaseAuth.instance.currentUser!.uid;
                            // userTeacher = FirebaseAuth.instance.currentUser;
                            await FirebaseAuth.instance.signOut();
                            final credentiall = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: Adminemail!, password: Adminpass!);
                            WhichAdmin = FirebaseAuth.instance.currentUser!.uid;
                            addTeacher(context);
                            NumOfTeacher = NumOfTeacher! + 1;
                            // FirebaseFirestore.instance
                            //     .collection('Admins')
                            //     .add({'name': username.text,
                            //   'email': email.text,});
                            //  String uid = userCredential.user.uid;
                            // await admins.add({
                            //   'name': username,
                            //   'email': email,
                            // });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'The password provided is too weak.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                              AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'The account already exists for that email.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("========err");
                          // AwesomeDialog(
                          //         context: context,
                          //         dialogType: DialogType.error,
                          //         animType: AnimType.rightSlide,
                          //         title: 'Error',
                          //         titleTextStyle: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 22),
                          //         desc:
                          //             'The account already exists for that email.',
                          //         descTextStyle: TextStyle(fontSize: 17))
                          //     .show();
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


















// // import 'package:first_version/constants.dart';
// // import 'package:flutter/material.dart';
// //  class AddProfessorForm extends StatelessWidget {
// //   final TextEditingController _nameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _addressController = TextEditingController();
// //   final TextEditingController _idController = TextEditingController();
// //   String _selectedFaculty = 'Faculty of Engineering and Information Technology';
// //   String _selectedSpecialty = 'Computer systems engineering Department';

// //   final List<String> faculties = [
// //     'Faculty of Engineering and Information Technology',
// //     'Faculty of Arts',
// //     'Faculty of Law',
// //     'Faculty of Administrative and Financial Sciences',
// //     'Faculty of Allied Medical Sciences',
// //     'Faculty of Nursing',
// //     'Faculty of Sports Sciences',
// //     'Faculty of Medicine',
// //     'Faculty of Dentistry',
// //   ];
// //   final List<String> specialties = [
// //     'Computer systems engineering Department',
// //     'Architecture Engineering Department',
// //     'Electrical Engineering Department',
// //     'Civil Engineering Department',
// //     'Computer Science Department',
// //     'Multimedia Technology Department',
// //     'Geographic Information Systems (GIS) Department',
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Add Teacher',style: TextStyle(fontSize: 22),),
// //         centerTitle: true,
// //         backgroundColor: kPrimaryColor,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(12.0),
// //         child: Column(
// //           children: [
// //             TextFormField(
// //               controller: _nameController,
// //               decoration: InputDecoration(labelText: 'Name'),
// //             ),
// //             SizedBox(height: 10),
// //             TextFormField(
// //               controller: _emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             SizedBox(height: 10),
// //             TextFormField(
// //               controller: _addressController,
// //               decoration: InputDecoration(labelText: 'Address'),
// //             ),
// //             SizedBox(height: 10),
// //             TextFormField(
// //               controller: _idController,
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(labelText: 'ID'),
// //             ),
// //             SizedBox(height: 10),
// //             DropdownButtonFormField<String>(
// //               value: _selectedFaculty,
// //               items: faculties.map((String faculty) {
// //                 return DropdownMenuItem<String>(
// //                   value: faculty,
// //                   child: Text(faculty),
// //                 );
// //               }).toList(),
// //               onChanged: (String? value) {
// //                 _selectedFaculty = value!;
// //               },
// //               decoration: InputDecoration(labelText: 'Faculty'),
// //             ),
// //             SizedBox(height: 10),
// //             DropdownButtonFormField<String>(
// //               value: _selectedSpecialty,
// //               items: specialties.map((String specialty) {
// //                 return DropdownMenuItem<String>(
// //                   value: specialty,
// //                   child: Text(specialty),
// //                 );
// //               }).toList(),
// //               onChanged: (String? value) {
// //                 _selectedSpecialty = value!;
// //               },
// //               decoration: InputDecoration(labelText: 'Specialty'),
// //             ),
// //             SizedBox(height: 30),
// //             ElevatedButton(
// //                   onPressed: () {
// //                      Navigator.pushNamed(context, "/homeTeacher");
// //                   },
// //                   style: ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all(kPrimaryColor),
// //                     padding: MaterialStateProperty.all(
// //                         EdgeInsets.symmetric(horizontal: 80, vertical: 10)),
// //                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(27))),
// //                   ),
// //                   child: Text(
// //                     "Submit",
// //                     style: TextStyle(fontSize: 24),
// //                   ),
// //                 ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void submitForm(BuildContext context) {
     
// //     String name = _nameController.text;
// //     String email = _emailController.text;
// //     String address = _addressController.text;
// //     int id = int.tryParse(_idController.text) ?? 0;

     
// //     print('Name: $name');
// //     print('Email: $email');
// //     print('Address: $address');
// //     print('ID: $id');
// //     print('Faculty: $_selectedFaculty');
// //     print('Specialty: $_selectedSpecialty');

   
// //     Navigator.pop(context);
// //   }
// // }

 