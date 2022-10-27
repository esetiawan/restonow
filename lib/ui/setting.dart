import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/provider/preferences_provider.dart';
class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
        builder: (context,provider,child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              [ Switch(
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,
                      value: provider.isReminderEnabled,
                      onChanged: (value) async{
                        provider.enableReminder(value);
                      },
                    ),
                  Text('Restaurant Notification', style: TextStyle(fontSize: 20))
                ]
            );
          }
        );
  }
}
