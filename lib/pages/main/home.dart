import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/common/components/index.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:macau_exam/Controller/translationController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isShowSearchBar = false;
  late TextEditingController _controller;
  static const Size _kDefaultTestViewportSize = Size(800.0, 600.0);
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  double payout = 2000.00;
  double income = 1000.00;

  final TranslationController _translationController =
      Get.find<TranslationController>();

  void Function() onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => MyDialog(
        title: 'My Dialog',
        message:
            'Use showDialog with Dialog.fullscreen, AlertDialog, or SimpleDialog',
        positiveButtonText: 'OK',
        onPositivePressed: () => Navigator.of(context).pop(),
      ),
    );
    return () {};
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.add_business,
                        color: Theme.of(context).colorScheme.primary, size: 18),
                  ),
                  Text(
                    '新增記錄'.tr,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('現金'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('信用卡'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fastfood_outlined,
                      size: 14,
                    ),
                    label: const Text('食物', style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.car_crash_outlined,
                      size: 14,
                    ),
                    label: const Text('交通', style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.games_outlined,
                      size: 14,
                    ),
                    label: const Text('娛樂', style: TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.devices_other_outlined,
                      size: 14,
                    ),
                    label: const Text('其他', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isShowSearchBar = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: !isShowSearchBar
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isShowSearchBar = !isShowSearchBar;
                    });
                  },
                  icon: const Icon(Icons.search_outlined),
                )
              : null,
          title: isShowSearchBar
              // change to search anchor or search anchor.bar
              ? SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    key: const Key("homePage_SearchBar"),
                    controller: _controller,
                    autofocus: true,
                    textAlign: TextAlign.start,
                    scrollPadding: const EdgeInsets.only(left: 10),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 5),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Icon(Icons.search_outlined),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                )
              : const Text('主頁'),
          actions: [
            MenuAnchor(
              style: MenuStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4);
                    } else {
                      return Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4);
                    }
                  },
                ),
              ),
              builder: (context, controller, child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.currency_exchange_outlined),
                );
              },
              menuChildren: [
                MenuItemButton(
                  child: const Text('MOP'),
                  onPressed: () {},
                ),
                MenuItemButton(
                  child: const Text('HKD'),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                );
              },
              icon: Get.isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.brightness_2_outlined),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 70,
              child: GlassContainer(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('收入'),
                        Text(NumberFormat.simpleCurrency(
                                locale: Get.locale!.languageCode == 'tc'
                                    ? 'zh_hk'
                                    : Get.locale!.languageCode == "sc"
                                        ? 'zh_CN'
                                        : Get.locale!.languageCode)
                            .format(payout))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('支出'),
                        Text(NumberFormat.simpleCurrency(
                                locale: Get.locale!.languageCode == 'tc'
                                    ? 'zh_hk'
                                    : Get.locale!.languageCode == "sc"
                                        ? 'zh_CN'
                                        : Get.locale!.languageCode)
                            .format(income))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GlassContainer(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.transparent)),
                  ),
                  rowHeight: 60,
                  daysOfWeekHeight: 24,
                  calendarFormat: _calendarFormat,
                  formatAnimationCurve: Curves.easeInOutCirc,
                  formatAnimationDuration: const Duration(milliseconds: 300),
                  pageAnimationCurve: Curves.easeInToLinear,
                  pageAnimationDuration: const Duration(milliseconds: 300),
                  availableCalendarFormats: Map<CalendarFormat, String>.from({
                    CalendarFormat.month: _translationController.currLang ==
                                const Locale('tc', 'TC') ||
                            _translationController.currLang ==
                                const Locale('sc', 'SC')
                        ? '月'
                        : 'Month',
                    CalendarFormat.twoWeeks: _translationController.currLang ==
                                const Locale('tc', 'TC') ||
                            _translationController.currLang ==
                                const Locale('sc', 'SC')
                        ? '兩星期'
                        : 'Two weeks',
                    CalendarFormat.week: _translationController.currLang ==
                                const Locale('tc', 'TC') ||
                            _translationController.currLang ==
                                const Locale('sc', 'SC')
                        ? '一星期'
                        : 'Week'
                  }),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  currentDay: DateTime.now(),
                  locale: Get.locale!.languageCode == 'tc'
                      ? 'zh_CN'
                      : Get.locale!.languageCode == "sc"
                          ? 'zh_CN'
                          : Get.locale!.languageCode,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          mini: true,
          shape: const CircleBorder(),
          onPressed: () => {
            setState(() {
              isShowSearchBar = false;
            }),
            _showBottomSheet(context)
          },
          child: const Icon(Icons.edit_outlined),
        ),
      ),
    );
  }
}
