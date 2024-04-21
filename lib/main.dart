import 'package:flutter/material.dart';
import 'package:sixth_state2_project/apple_news.dart';
import 'package:sixth_state2_project/selected_items_cart/cart_screen_widget.dart';
import 'package:sixth_state2_project/shop_screen/devices_zone.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/models/shop_state_model.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixth_state2_project/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShopStateModel()),
        ChangeNotifierProvider(create: (context) => PreferencesStateModel())
      ],
      child: Consumer<PreferencesStateModel>(
        builder: (
          context,
          value,
          child,
        ) {
          value.loadTheme();
          return MaterialApp(
            //adding routes
            initialRoute: '/',
            routes: {
              '/': (context)=>const SplashScreen(),
              '/news': (context)=>const AppleNews(), 
            },
            theme: ThemeData(
              brightness: value.savedTheme == 'light'
                  ? Brightness.light
                  : Brightness.dark,
              textTheme: GoogleFonts.golosTextTextTheme(),
            ),
            debugShowCheckedModeBanner: false,
          //  home: const SplashScreen(),
          );
        },
      ),
    ),
  );
}

class MainSelectItems extends StatefulWidget {
  const MainSelectItems({super.key});

  @override
  State<MainSelectItems> createState() => _MainSelectItemsState();
}

class _MainSelectItemsState extends State<MainSelectItems>
    with SingleTickerProviderStateMixin {
  int indexState = 0;
  List screens = [
    const DevicesZone(),
    const CartScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexState],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Provider.of<PreferencesStateModel>(
                  context,
                  listen: true,
                ).savedTheme ==
                'light'
            ? const Color.fromARGB(255, 181, 180, 176)
            : const Color.fromARGB(255, 0, 0, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.devices_outlined,
            ),
            label: "Devices",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: "Cart",
          )
        ],
        onTap: (index) {
          setState(
            () {
              indexState = index;
            },
          );
        },
        currentIndex: indexState,
      ),
    );
  }
}