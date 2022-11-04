import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/provider/preferences_provider.dart';
import 'package:resto/provider/scheduling_provider.dart';
class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Material(
        child: ListTile(
          title: const Text('Restaurant Notification', style: TextStyle(fontSize: 20)),
          trailing:
            Consumer2<SchedulingProvider,PreferencesProvider>(builder: (context,
                schedulingProvider, preferencesProvider, child) {
            return Switch.adaptive(
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                  value: preferencesProvider.isReminderEnabled,
                  onChanged: (value) async {
                    preferencesProvider.enableReminder(value);
                    schedulingProvider.scheduledResto(value);
                  });
            })
          ),
        ),
    ]);
  }
}
