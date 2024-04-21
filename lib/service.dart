import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Navigator(
              key: navigatorKey,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => const ServicesScreen(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomNavigationBar(navigatorKey),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const BottomNavigationBar(this.navigatorKey, {super.key});

  Future<void> push(Route route) {
    return navigatorKey.currentState!.push(route);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              push(
                MaterialPageRoute(
                  builder: (context) => const ServicesScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: theme == 'dark'
                    ? const Color.fromARGB(255, 38, 33, 33)
                    : const Color.fromARGB(255, 181, 180, 176),
                border: const Border(
                  right: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 115, 110, 110),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Сервіси',
                  style: TextStyle(
                    fontSize: 20,
                    color: theme == 'light' ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              push(
                MaterialPageRoute(
                  builder: (context) => const ContactsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: const Border(
                  left: BorderSide(
                      width: 1, color: Color.fromARGB(255, 115, 110, 110)),
                ),
                color: theme == 'dark'
                    ? const Color.fromARGB(255, 38, 33, 33)
                    : const Color.fromARGB(255, 181, 180, 176),
              ),
              child: Center(
                child: Text(
                  'Контакти',
                  style: TextStyle(
                    fontSize: 20,
                    color: theme == 'light' ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Наші сервісні центри",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: theme == 'light'
                          ? const Color.fromARGB(255, 38, 33, 33)
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 24,
              ),
              child: Text(
                "Проблеми з девайсом? Наші спеціалісти будуть раді допомогти вам в одному із наших сервісних центрів",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme == 'light'
                        ? const Color.fromARGB(255, 38, 33, 33)
                        : Colors.white,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              width: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 218, 7, 7),
                    ),
                  ),
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Зрозуміло",
                    style: TextStyle(
                      color: theme == 'light'
                          ? const Color.fromARGB(255, 38, 33, 33)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                color: theme == 'dark'
                    ? const Color.fromARGB(255, 38, 33, 33)
                    : const Color.fromARGB(255, 181, 180, 176),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/service1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,
                        bottom: 20,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Академіка Вернадського, 35",
                            style: TextStyle(
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 38, 33, 33)
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Київ",
                            style: TextStyle(
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 38, 33, 33)
                                    : Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                color: theme == 'dark'
                    ? const Color.fromARGB(255, 38, 33, 33)
                    : const Color.fromARGB(255, 181, 180, 176),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/service2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10, bottom: 20, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "вул. Лесі Українки 17-б, тц Форум ",
                            style: TextStyle(
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 38, 33, 33)
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Львів",
                            style: TextStyle(
                              fontSize: 18,
                              color: theme == 'light'
                                  ? const Color.fromARGB(255, 38, 33, 33)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Container(
                color: theme == 'dark'
                    ? const Color.fromARGB(255, 38, 33, 33)
                    : const Color.fromARGB(255, 181, 180, 176),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/service3.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,
                        bottom: 20,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "пр. Степана Бандери, тц Панорама",
                            style: TextStyle(
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 38, 33, 33)
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Одеса",
                            style: TextStyle(
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 38, 33, 33)
                                    : Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Як ми можемо вам допомогти?",
                      style: TextStyle(
                        fontSize: 30,
                        color: theme == 'light'
                            ? const Color.fromARGB(255, 38, 33, 33)
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 24,
              ),
              child: Text(
                "Якщо у вас залишилися деякі питання, або ви не змогли знайти необхідної інформації, зверніться до нашого call-центру",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme == 'light'
                        ? const Color.fromARGB(255, 38, 33, 33)
                        : Colors.white,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Наш загальний номер\n",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: theme == 'light'
                            ? const Color.fromARGB(255, 38, 33, 33)
                            : Colors.white,
                        fontSize: 16),
                    children: const [
                      TextSpan(
                        text: "0800 509 382",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 218, 7, 7),
                      ),
                    ),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      "Зрозуміло",
                      style: TextStyle(
                        color: theme == 'light'
                            ? const Color.fromARGB(255, 38, 33, 33)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
