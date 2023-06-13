// ignore: file_names
import 'package:flutter/material.dart';
import 'package:macau_exam/Controller/themeController.dart';
import 'package:get/get.dart';
import 'package:macau_exam/Controller/translationController.dart';
import 'package:permission_handler/permission_handler.dart';
import '/common/components/index.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> with WidgetsBindingObserver {
  late PermissionStatus status = PermissionStatus.granted;
  final ThemeController _themeController = Get.find<ThemeController>();
  final TranslationController _translationController =
      Get.find<TranslationController>();
  bool isShowBottomSheet = false;

  final List _language = [
    {'tc': '繁體中文', 'en': 'English', 'sc': '简体中文'}
  ];

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return Icon(Icons.check,
          color: Theme.of(Get.context!).colorScheme.onPrimary);
    }
    return Icon(Icons.close,
        color: Theme.of(Get.context!).colorScheme.onPrimary);
  });

  Future<void> _requestPermissions() async {
    Permission.notification.request().then(
          (value) => setState(
            () {
              status = value;
            },
          ),
        );
  }

  Future<void> _revokeNotificationPermission(BuildContext context) async {
    // if (isEnableNotification) {
    final bool result = await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Revoke Notification Permission'),
        content: const Text(
            'Are you sure you want to revoke the notification permission?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('Revoke'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
    if (result) {
      openAppSettings().then(
        (value) => _checkNotificationPermission().then(
          (value) => setState(
            () {
              status = value;
            },
          ),
        ),
      );
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                selected: _translationController.currLang.languageCode == 'tc',
                selectedColor: Theme.of(context).colorScheme.primary,
                title: const Text('繁體中文', textAlign: TextAlign.center),
                onTap: () async => {
                      await _translationController
                          .setLocale(const Locale('tc', 'TC')),
                    }),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              selected: _translationController.currLang.languageCode == 'en',
              selectedColor: Theme.of(context).colorScheme.primary,
              title: const Text('English', textAlign: TextAlign.center),
              onTap: () async => {
                await _translationController
                    .setLocale(const Locale('en', 'US')),
              },
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              selected: _translationController.currLang.languageCode == 'sc',
              selectedColor: Theme.of(context).colorScheme.primary,
              title: const Text('简体中文', textAlign: TextAlign.center),
              onTap: () async => {
                await _translationController
                    .setLocale(const Locale('sc', 'SC')),
              },
            ),
          ],
        );
      },
    );
  }

  Future<PermissionStatus> _checkNotificationPermission() async {
    return await Permission.notification.status;
  }

  @override
  void initState() {
    _checkNotificationPermission().then(
      (value) => setState(
        () {
          status = value;
        },
      ),
    );
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final granted = await Permission.notification.isGranted;
      if (granted) {
        setState(() {
          status = PermissionStatus.granted;
        });
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context),
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,
              size: 28, color: Theme.of(context).colorScheme.onPrimary),
        ),
        title: Text(
          'setting'.tr,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
          ),
        ),
      ),
      body: SizedBox(
        child: GlassContainer(
          blur: 5,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.dark_mode,
                      color: Theme.of(context).colorScheme.onPrimary),
                  const SizedBox(width: 10),
                  Text(
                    'darkMore'.tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: _themeController.isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _themeController.toggleTheme(value);
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                    activeTrackColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                    inactiveTrackColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    thumbIcon: thumbIcon,
                    trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Theme.of(context).colorScheme.secondary;
                    }),
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.4),
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Icon(Icons.language,
                        color: Theme.of(context).colorScheme.onPrimary),
                    const SizedBox(width: 10),
                    Text(
                      'language'.tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => {_showBottomSheet(context)},
                      child: Text(
                        _language
                                .where((element) => element[
                                    _translationController
                                        .currLang.languageCode] is String)
                                .first[
                            _translationController.currLang.languageCode],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.4),
                thickness: 1,
              ),
              Row(
                children: [
                  Icon(Icons.notifications_none_outlined,
                      color: Theme.of(context).colorScheme.onPrimary),
                  const SizedBox(width: 10),
                  Text(
                    'notification'.tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: status.isGranted,
                    onChanged: (value) {
                      //disable notification
                      if (!value) {
                        _revokeNotificationPermission(context);
                      } else {
                        //enable notification
                        _requestPermissions();
                      }
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                    activeTrackColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                    inactiveTrackColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    thumbIcon: thumbIcon,
                    trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Theme.of(context).colorScheme.secondary;
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
