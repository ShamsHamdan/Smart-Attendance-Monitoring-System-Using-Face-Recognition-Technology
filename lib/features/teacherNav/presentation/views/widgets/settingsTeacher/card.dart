
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/data.dart';
import 'package:flutter/material.dart';

Widget cards(BuildContext context, int index) {
    return Center(
      child: Container(
        margin:const EdgeInsets.only(bottom: 14),
        width: MediaQuery.of(context).size.width * .95,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 1)
            ]),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: data[index].iconBgColor,
            ),
            child: Icon(
              data[index].icon,
              color: data[index].iconColor,
            ),
          ),
          title: Text(
            data[index].label,
            style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: data[index].trailing,
        ),
      ),
    );
  }


