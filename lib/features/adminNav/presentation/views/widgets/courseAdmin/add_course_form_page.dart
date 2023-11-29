import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                decoration: const InputDecoration(labelText: 'Select Specialization'),
                items: specializations.map((specialization) {
                  return DropdownMenuItem<String>(
                    value: specialization,
                    child: Text(specialization),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  print('Course Name: $courseName');
                  print('Identity: $identity');
                  print('Selected Faculty: $selectedFaculty');
                  print('Selected Specialization: $selectedSpecialization');
                },
                child: const Text('submit Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}