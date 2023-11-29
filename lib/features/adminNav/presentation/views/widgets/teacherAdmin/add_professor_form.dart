import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';
 class AddProfessorForm extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  String _selectedFaculty = 'Faculty of Engineering and Information Technology';
  String _selectedSpecialty = 'Computer systems engineering Department';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Teacher',style: TextStyle(fontSize: 22),),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedFaculty,
              items: faculties.map((String faculty) {
                return DropdownMenuItem<String>(
                  value: faculty,
                  child: Text(faculty),
                );
              }).toList(),
              onChanged: (String? value) {
                _selectedFaculty = value!;
              },
              decoration: InputDecoration(labelText: 'Faculty'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedSpecialty,
              items: specialties.map((String specialty) {
                return DropdownMenuItem<String>(
                  value: specialty,
                  child: Text(specialty),
                );
              }).toList(),
              onChanged: (String? value) {
                _selectedSpecialty = value!;
              },
              decoration: InputDecoration(labelText: 'Specialty'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, "/homeTeacher");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 80, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void submitForm(BuildContext context) {
     
    String name = _nameController.text;
    String email = _emailController.text;
    String address = _addressController.text;
    int id = int.tryParse(_idController.text) ?? 0;

     
    print('Name: $name');
    print('Email: $email');
    print('Address: $address');
    print('ID: $id');
    print('Faculty: $_selectedFaculty');
    print('Specialty: $_selectedSpecialty');

   
    Navigator.pop(context);
  }
}

 