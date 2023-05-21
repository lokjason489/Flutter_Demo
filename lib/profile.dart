import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:macau_exam/appSetting.dart';
import 'package:macau_exam/glassContainer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isErrorOccurred = false;
  final ImageProvider emptyImage = AssetImage('assets/images/empty.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 150),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AppSetting(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  );
                  return SlideTransition(
                    position: tween.animate(curvedAnimation),
                    child: child,
                  );
                },
              ),
            );
          },
          icon: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary, size: 28),
        ),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
              child: GlassContainer(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: 'profileImage',
                      child: CircleAvatar(
                        key: const ValueKey('profileImage'),
                        radius: 50,
                        backgroundImage: isErrorOccurred
                            ? emptyImage
                            : const NetworkImage(
                                'https://placehold.co/500x500/png'),
                        onBackgroundImageError: (exception, stackTrace) {
                          setState(() {
                            isErrorOccurred = true;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        width: 25,
                        height: 25,
                        transformAlignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: IconButton(
                          onPressed: () {
                            //open the image dialog
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (BuildContext context, _, __) {
                                  return Container(
                                    padding: EdgeInsets.all(50),
                                    child: Hero(
                                      tag: 'profileImage',
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: isErrorOccurred
                                                ? emptyImage
                                                : const NetworkImage(
                                                    'https://placehold.co/500x500/png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                          },
                          padding: const EdgeInsets.all(0),
                          icon: Icon(Icons.search,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'john.doe@example.com',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec lectus eget est consequat bibendum. Nullam tincidunt neque vel vulputate finibus. Fusce auctor, augue a lacinia elementum, felis quam tempus turpis, id bibendum quam massa vel ex. Duis ut nibh non mi varius faucibus.',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
