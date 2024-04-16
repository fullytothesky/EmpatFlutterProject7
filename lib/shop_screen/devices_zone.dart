import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sixth_state2_project/drawer/stores.dart';
import 'package:sixth_state2_project/drawer/preferences_drawer.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:sixth_state2_project/models/shop_state_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DevicesZone extends StatelessWidget {
  const DevicesZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme =
        Provider.of<PreferencesStateModel>(context, listen: true).savedTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: theme == 'light'
              ? const Color.fromARGB(255, 181, 180, 176)
              : const Color.fromARGB(255, 0, 0, 0)),
      drawer: Drawer(
        backgroundColor: theme == "light"
            ? const Color.fromARGB(255, 181, 180, 176)
            : Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 100,
                          decoration: const BoxDecoration(),
                          child: Image.asset(
                            "assets/img/user_default.png",
                            fit: BoxFit.contain,
                          ))),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Consumer<PreferencesStateModel>(
                            builder: (context, prefs, child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: RichText(
                                  text: TextSpan(
                                      text: "привіт, ",
                                      style: GoogleFonts.golosText(
                                          textStyle: TextStyle(
                                        fontSize: 20,
                                        color: prefs.savedTheme == "light"
                                            ? Colors.black
                                            : Colors.white,
                                      )),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${prefs.savedUsername}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25))
                                      ]),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            buildTile(
              context,
              Icons.settings_outlined,
              "Налаштування",
              const PreferencesWidget(),
            ),
            buildTile(
              context,
              Icons.apple,
              "Завітайте до нас",
              const StoreWidget(),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 15),
                      child: Text(
                        "Для балакучок у Slack",
                        style: TextStyle(
                          color: theme == 'light' ? Colors.black : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Provider.of<PreferencesStateModel>(
                                context,
                                listen: true,
                              ).savedTheme ==
                              'light'
                          ? const Color.fromARGB(255, 130, 128, 121)
                          : const Color.fromARGB(255, 0, 0, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            itemBuilder(
                              context,
                              "Apple iPhone 15",
                              34.999,
                            ),
                            itemBuilder(
                              context,
                              "Apple iPhone 15 Pro",
                              53.999,
                            ),
                            itemBuilder(
                              context,
                              "Apple iPhone 15 Pro Max",
                              48.999,
                            ),
                            itemBuilder(
                              context,
                              "Apple iPhone 13",
                              30.999,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 15,
                      ),
                      child: Text(
                        "Ноутбуки для домашок",
                        style: TextStyle(
                          color: theme == 'light' ? Colors.black : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Provider.of<PreferencesStateModel>(
                                context,
                                listen: true,
                              ).savedTheme ==
                              'light'
                          ? const Color.fromARGB(255, 130, 128, 121)
                          : const Color.fromARGB(255, 0, 0, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            itemBuilder(
                              context,
                              "MacBook Air 13",
                              34.999,
                            ),
                            itemBuilder(
                              context,
                              "MacBook Air 15",
                              53.999,
                            ),
                            itemBuilder(
                              context,
                              "MacBook Pro 14",
                              48.999,
                            ),
                            itemBuilder(
                              context,
                              "MacBook Pro 16",
                              30.999,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 14.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 15,
                      ),
                      child: Text(
                        "Навушники для лекцій Сергія",
                        style: TextStyle(
                          color: theme == 'light' ? Colors.black : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Provider.of<PreferencesStateModel>(
                                context,
                                listen: true,
                              ).savedTheme ==
                              'light'
                          ? const Color.fromARGB(255, 169, 166, 156)
                          : Colors.black,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            itemBuilder(
                              context,
                              "Apple AirPods Pro",
                              9.999,
                            ),
                            itemBuilder(
                              context,
                              "Apple AirPods Max",
                              22.999,
                            ),
                            itemBuilder(
                              context,
                              "Apple AirPods 3",
                              10.999,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(context, String name, double price) {
    String formattedPrice = price.toStringAsFixed(3);
    String formattedName = name.replaceAll(' ', '');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ShopStateModel>(
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 800,
            ),
            height: value.selectedItems.contains(name) ? 190 : 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Provider.of<PreferencesStateModel>(
                        context,
                        listen: false,
                      ).savedTheme ==
                      'dark'
                  ? value.selectedItems.contains(name)
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 53, 43, 43)
                  : value.selectedItems.contains(name)
                      ? const Color.fromARGB(255, 123, 171, 79)
                      : const Color.fromARGB(255, 210, 200, 200),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image(
                    image: AssetImage("assets/img/$formattedName.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          color: Provider.of<PreferencesStateModel>(
                                    context,
                                    listen: true,
                                  ).savedTheme ==
                                  'light'
                              ? Colors.black
                              : Provider.of<PreferencesStateModel>(
                                            context,
                                            listen: true,
                                          ).savedTheme ==
                                          'dark' &&
                                      value.selectedItems.contains(name)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                      Text(
                        "$formattedPrice UAH",
                        style: TextStyle(
                          fontSize: 20,
                          color: Provider.of<PreferencesStateModel>(
                                    context,
                                    listen: true,
                                  ).savedTheme ==
                                  'light'
                              ? Colors.black
                              : Provider.of<PreferencesStateModel>(
                                            context,
                                            listen: true,
                                          ).savedTheme ==
                                          'dark' &&
                                      value.selectedItems.contains(name)
                                  ? Colors.black
                                  : Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          value.addItem(
                            name,
                            price,
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(248, 203, 43, 8),
                          ),
                        ),
                        child: Text(
                          value.selectedItems.contains(name)
                              ? "Додано: ${value.selectedItems.where((element) => element == name).length}"
                              : "У кошик",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTile(context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        leading: Icon(
          icon,
          size: 35,
        ),
        title: Text(
          title,
          style: GoogleFonts.golosText(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
