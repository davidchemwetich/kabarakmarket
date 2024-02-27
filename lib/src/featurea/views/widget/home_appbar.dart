import 'package:flutter/material.dart';
import 'package:kabarakmarket/src/featurea/views/profile/greet_logic.dart';

class AppbarUI extends StatelessWidget implements PreferredSizeWidget {
  const AppbarUI({required super.key});

  @override
  Widget build(BuildContext context) {
    Greeting greeting = Greeting();
    Widget message = greeting.greetSomeone('world');
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Title(color: Colors.black, child: message),
      ),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: GestureDetector(
            onTap: () {},
            child: const SizedBox(
              child: Badge(
                label: Text('4'),
                child: Icon(
                  Icons.notification_important_rounded,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Builder(builder: (context) {
            return IconButton(
              icon: const CircleAvatar(
                child: Icon(
                  Icons.menu,
                  color: Colors.pink,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF2e1e37),
          Color(0xFF3c2245),
          Color(0xFF491f52),
          Color(0xFF551d60),
        ])),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
