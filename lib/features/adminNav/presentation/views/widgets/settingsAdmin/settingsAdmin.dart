import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/body_settings_admin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/card.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/data.dart';
import 'package:flutter/material.dart';

class SettingsAdmin extends StatelessWidget {
  const SettingsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Settings',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white)),
        centerTitle: true,
      //  leading: Icon(Icons.home),
      automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(Icons.notifications,color: Colors.white,),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kPrimaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: BodySettningsAdmin()
    );
  }
}
