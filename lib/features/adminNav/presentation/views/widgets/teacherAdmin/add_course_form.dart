import 'dart:io';
import 'dart:typed_data';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddCourseFormPage(),
    );
  }
}

class AddCourseFormPage extends StatefulWidget {
  const AddCourseFormPage({Key? key}) : super(key: key);

  @override
  _AddCourseFormPageState createState() => _AddCourseFormPageState();
}

class _AddCourseFormPageState extends State<AddCourseFormPage> {
  String courseName = '';
  String identity = '';
  String selectedFaculty = '';
  String selectedSpecialization = '';
  String doctorName = '';
  Uint8List? _image;
  File? selectedImage;
  DateTime? selectedDateTime;

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

  List<String> specializations = [
    'Computer systems engineering Department',
    'Architecture Engineering Department',
    'Electrical Engineering Department',
    'Civil Engineering Department',
    'Computer Science Department',
    'Multimedia Technology Department',
    'Geographic Information Systems (GIS) Department',
  ];

  TextEditingController dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Add Course',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          leading:  IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                                      image: AssetImage('assets/images/camAddcourse.jpg'),
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
                 SizedBox(height: 40,),
              // حقلات الإدخال (الاسم، الهوية، الطبيب، التخصص، الكلية، ...)
              TextField(
                onChanged: (value) {
                  setState(() {
                    courseName = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Course Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    identity = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Identity'),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    doctorName = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Doctor Name'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    selectedFaculty = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Select Faculty'),
                items: faculties.map((faculty) {
                  return DropdownMenuItem<String>(
                    value: faculty,
                    child: Text(faculty),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                onChanged: (value) {
                  setState(() {
                    selectedSpecialization = value!;
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'Select Specialization'),
                items: specializations.map((specialization) {
                  return DropdownMenuItem<String>(
                    value: specialization,
                    child: Text(specialization),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // حقل اختيار الوقت والتاريخ
              TextFormField(
                readOnly: true,
                controller: dateTimeController,
                decoration: InputDecoration(
                  labelText: 'Select Date Time',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectDateTime(context);
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const SizedBox(height: 16),
           ElevatedButton(
                  onPressed: () {
                    //  Navigator.pushNamed(context, "/homeTeacher");
                    print('Course Name: $courseName');
                  print('Identity: $identity');
                  print('Doctor Name: $doctorName');
                  print('Selected Faculty: $selectedFaculty');
                  print('Selected Specialization: $selectedSpecialization');
                  if (selectedImage != null) {
                    print('Selected Image: $selectedImage');
                  }
                  if (selectedDateTime != null) {
                    print('Selected Date Time: $selectedDateTime');
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
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                ),
            
              
            ],
          ),
        ),
      ),
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
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }

  void _selectDateTime(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime startInitialDate = now.subtract(Duration(days: now.weekday - 1)); // Monday
    DateTime endInitialDate = startInitialDate.add(const Duration(days: 2)); // Wednesday

    List<DateTime>? dateTimeList = await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: startInitialDate,
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      endInitialDate: endInitialDate,
      endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      endLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Enable only Monday and Wednesday
        return dateTime.weekday == DateTime.monday || dateTime.weekday == DateTime.wednesday;
      },
    );

    if (dateTimeList != null && dateTimeList.isNotEmpty) {
      setState(() {
        selectedDateTime = dateTimeList[0];
        dateTimeController.text =
            DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime!);
      });
    }
  }
}

