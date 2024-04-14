import 'package:flutter/material.dart';
import 'package:sixth_state2_project/selected_items_cart/cart_screen_widget.dart';
import 'package:sixth_state2_project/shop_screen/devices_zone.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/shop_state_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ShopStateModel(),
    child: const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainSelectItems()),
  ));
}

class MainSelectItems extends StatefulWidget {
  const MainSelectItems({super.key});

  @override
  State<MainSelectItems> createState() => _MainSelectItemsState();
}

class _MainSelectItemsState extends State<MainSelectItems>
    with SingleTickerProviderStateMixin {
  int indexState = 0;
  List screens = [const DevicesZone(), const CartScreenWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexState],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(91, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.devices_outlined), label: "Devices"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart")
          ],
          onTap: (index) {
            setState(() {
              indexState = index;
            });
          },
          currentIndex: indexState),
    );
  }
}

