import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileadmin extends StatefulWidget {
  const EditProfileadmin({super.key});

  @override
  State<EditProfileadmin> createState() => _EditProfileadminState();
}

class _EditProfileadminState extends State<EditProfileadmin>
    with SingleTickerProviderStateMixin {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _status = true;
  Uint8List? _image;
  File? selectedImage;
  var urlAdmin;
  DocumentSnapshot? data1;
  String? oldname;
  String? oldemail;
  String? idd;
  String? oldUrl;

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admins')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    DocumentSnapshot data1 = querySnapshot.docs[0];
    Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
      oldname = data1['name'];
    //  oldemail = data1['email'];
      idd = data1.id;
    });
    if (data != null && data.containsKey('url')) {
      setState(() {
        //  print(oldemail);

        print(data);
        oldUrl = data['url'];
        print("****************************************$oldUrl");
      });
    } else {
      setState(() {
        oldUrl = null;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> updateAdmin(BuildContext context) async {
    // Call the user's CollectionReference to add a new user
    try {
      if (urlAdmin == null) {
        await FirebaseFirestore.instance.collection('Admins').doc(idd).update({
          "name": username.text,
         // "email": email.text,
        });
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Password changed successfully.'),
      //     ),
      //  );
          AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'Updated successfully.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();

        // .then((value) {
        //   print("===================================admin update$urlAdmin");
        // }).catchError((error) =>
        //     print("=============================Failed to update admin: $error"));
      } else {
        await FirebaseFirestore.instance.collection('Admins').doc(idd).update({
          "name": username.text,
         // "email": email.text,
          "url": urlAdmin ?? '',
        }).then((value) {
            AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'Updated successfully.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();
          print("===================================admin update$urlAdmin");
        }).catchError((error) => print(
            "=============================Failed to update admin: $error"));
      }
    } catch (error) {
      print("Failed to update admin: $error");
    }
  }
  //final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
        centerTitle: true, // Empty title
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  color: Colors.grey[100],
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
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
                                  backgroundImage:urlAdmin !=null && urlAdmin!.isNotEmpty? 
                                  NetworkImage(
                                              Uri.parse(urlAdmin!).toString()) :
                                      oldUrl != null && oldUrl!.isNotEmpty
                                          ? NetworkImage(
                                              Uri.parse(oldUrl!).toString())
                                          : AssetImage(AssetsData.profilepic)
                                              as ImageProvider<Object>  ,
                                  radius: 70,
                                ),
                              ),
                            ],
                          ),
                          Padding(
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
                Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Parsonal Information',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    _status ? _getEditIcon() : Container(),
                                  ],
                                )
                              ],
                            )),
                        Form(
                          key: formState,
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        validator: (val) {
                                          if (val == "") {
                                            return "Empty filed";
                                          }
                                        },
                                        controller: username,
                                        decoration: const InputDecoration(
                                          hintText: "Enter Your Name",
                                        ),
                                        enabled: !_status,
                                        autofocus: !_status,
                                      ),
                                    ),
                                  ],
                                )),
                            // Padding(
                            //     padding: EdgeInsets.only(
                            //         left: 25.0, right: 25.0, top: 25.0),
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: <Widget>[
                            //         Column(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: <Widget>[
                            //             Text(
                            //               'Email',
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   fontWeight: FontWeight.bold),
                            //             ),
                            //           ],
                            //         ),
                            //       ],
                            //     )),
                            // Padding(
                            //     padding: EdgeInsets.only(
                            //         left: 25.0, right: 25.0, top: 2.0),
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: <Widget>[
                            //         Flexible(
                            //           child: TextFormField(
                            //             validator: (val) {
                            //               if (val == "") {
                            //                 return "Empty filed";
                            //               }
                            //             },
                            //             controller: email,
                            //             decoration: const InputDecoration(
                            //                 hintText: "Enter Your Email"),
                            //             enabled: !_status,
                            //           ),
                            //         ),
                            //       ],
                            //     )),
                          ]),
                        ),
                        !_status ? _getActionButtons(context) : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  // _pickImageFromGallery();
                  updateAdmin(context);
                },
                child: Container(
                  width: 100,
                  //  MediaQuery.of(context as BuildContext).size.width * .95,
                  height: 60,

                  margin: EdgeInsets.only(bottom: 55),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Confirm",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          username.text = oldname ?? '';
          email.text = oldemail ?? '';
          _status = false;
        });
      },
    );
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
      var refstorge = FirebaseStorage.instance.ref("admins").child(imageName);
      if (await selectedImage!.exists()) {
        await refstorge.putFile(selectedImage!);
        urlAdmin = await refstorge.getDownloadURL();
        print("aaaaaaaaaaaaaaaaaaaaa$urlAdmin");
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    // myFocusNode.dispose();
    super.dispose();
  }
}
