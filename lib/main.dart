import 'package:flutter/material.dart';
import 'package:widget_tutorial/model/notification_setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final allowNotifications = NotificationSetting(title: 'Allow Notifications');

  final notifications = [
    NotificationSetting(title: 'Show Message'),
    NotificationSetting(title: 'Show Group'),
    NotificationSetting(title: 'Show Calling'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: ListView(
        children: [
          buildToggleCheckbox(allowNotifications),
          Divider(),
          ...notifications.map(buildSingleCheckBox).toList(),
        ],
      ),
    );
  }

  Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        final newValue = !notification.value!;
        setState(() {
          allowNotifications.value = newValue;
          notifications.forEach((element) {
            element.value = newValue;
          });
        });
      });

  Widget buildSingleCheckBox(NotificationSetting notification) => buildCheckbox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.value!;
          notification.value = newValue;

          if (!newValue) {
            allowNotifications.value = false;
          } else {
            final allow =
                notifications.every((notification) => notification.value!);
            // notifications.forEach((element) {
            //   print('${element.title} : ${element.value}');
            // });
            // print(allow);
            allowNotifications.value = allow;
          }
        });
      });

  Widget buildCheckbox(
      {required NotificationSetting notification,
      required VoidCallback onClicked}) {
    return ListTile(
      onTap: onClicked,
      leading: Checkbox(
          value: notification.value,
          onChanged: (value) {
            onClicked();
          }),
      title: Text(
        notification.title!,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
