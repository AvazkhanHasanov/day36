import 'package:day_36_darsda1/core/utils/styles.dart';
import 'package:day_36_darsda1/features/common/widgets/bottom_navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:day_36_darsda1/features/common/widgets/recipe_app_bar_with_title.dart';
import 'package:day_36_darsda1/features/top_chefs/widgets/profile/switch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final settingBox = Hive.box('setting');
  bool notification = false;
  bool sound = false;
  bool soundCall = false;
  bool vibrate = false;

  @override
  void initState() {
    notification = settingBox.get('notification', defaultValue: false);
    sound = settingBox.get('sound', defaultValue: false);
    soundCall = settingBox.get('soundCall', defaultValue: false);
    vibrate = settingBox.get('vibrate', defaultValue: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBarWithTitle(text: 'Notification'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Column(
          children: [
            SwitchText(
              text: 'General Notification',
              textStyle: AppStyles.subtitle.copyWith(color: Theme.of(context).colorScheme.primary),
              value: notification,
              onChanged: (value) => setState(() {
                notification = value;
                settingBox.put('notification', value);
              }),
            ),
            SwitchText(
              text: 'Sound',
              textStyle: AppStyles.subtitle.copyWith(color: Theme.of(context).colorScheme.primary),
              value: sound,
              onChanged: (value) => setState(() {
                sound = value;
                settingBox.put('sound', value);
              }),
            ),
            SwitchText(
              text: 'Sound Call',
              textStyle: AppStyles.subtitle.copyWith(color: Theme.of(context).colorScheme.primary),
              value: soundCall,
              onChanged: (value) => setState(() {
                soundCall = value;
                settingBox.put('soundCall', value);
              }),
            ),
            SwitchText(
              text: 'Vibrate',
              textStyle: AppStyles.subtitle.copyWith(color: Theme.of(context).colorScheme.primary),
              value: vibrate,
              onChanged: (value) => setState(() {
                vibrate = value;
                settingBox.put('vibrate', value);
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
