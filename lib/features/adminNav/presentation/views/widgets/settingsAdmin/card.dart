
  import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/data.dart';
import 'package:flutter/material.dart';

Widget cards(BuildContext context, int index) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        width: MediaQuery.of(context).size.width * .95,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 1)
            ]),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: data[index].iconBgColor,
            ),
            child: Icon(
              data[index].icon,
              color: data[index].iconColor,
            ),
          ),
          title: Text(
            data[index].label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

          
          trailing: data[index].trailing,
        ),
      ),
    );
  }


