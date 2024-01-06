import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordTeacher extends StatefulWidget {
  const ChangePasswordTeacher({Key? key}) : super(key: key);

  @override
  _ChangePasswordTeacherState createState() => _ChangePasswordTeacherState();
}

class _ChangePasswordTeacherState extends State<ChangePasswordTeacher> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _currentPasswordController = TextEditingController();

  String? _errorMessage;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updatePassword(_newPasswordController.text);
         AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'Password changed successfully.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('Password changed successfully.'),
        //   ),
       // );
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''), // Empty title
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 38,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 20),
                  child: Text(
                    'Enter your new password',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: TextFormField(
                          controller: _currentPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Current Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your current password.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      child:  Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: TextFormField(
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'New Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a new password.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _changePassword();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
}
































// import 'package:first_version/constants.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordTeacher extends StatefulWidget {
//   const ChangePasswordTeacher({super.key});

//   @override
//   State<ChangePasswordTeacher> createState() => _ChangePasswordTeacherState();
// }

// class _ChangePasswordTeacherState extends State<ChangePasswordTeacher> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//        backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(''), // Empty title
//         leading: IconButton(
//           icon:const Icon(Icons.arrow_back, size: 25,color: Colors.black,),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
      
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView(
//             children: [
//   //             Positioned(
//   //               top: 0,
//   //               left: 0,
//   //               child: IconButton(
//   //   icon: Icon(Icons.arrow_back,size: 25,),
//   //   onPressed: () {
//   //     Navigator.pop(context);
//   //   },
//   // ),),
//               Container(
//                 alignment: Alignment.center,
//                 child: const Padding(
//                   padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
//                   child: Text(
//                     'Change Password',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       fontSize: 38,
//                       color: kPrimaryColor,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 20),
//                   child: Text(
//                     'Enter your new password',
//                     style: TextStyle(
//                       color: Colors.grey[800],
//                       fontSize: 19,
//                     ),
//                   ),
//                 ),
//               ),
//            const   SizedBox(height: 50,),
//               Container(
//                 child: const Padding(
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Email',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: const Padding(
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Current Password',
//                     ),
//                   ),
//                 ),
//               ),
//                Container(
//                 child: const Padding(
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'New Password',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: const Padding(
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Confirm Password',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(kPrimaryColor),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.circular(32.0)))
                                        
//                                         ),
//                     child: const Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Text(
//                         'Confirm',
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }