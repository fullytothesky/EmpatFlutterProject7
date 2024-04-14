import 'package:flutter/material.dart';
import 'package:sixth_state2_project/shop_screen/after_purchase_screen.dart';
import 'package:sixth_state2_project/shop_state_model.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatefulWidget {
  const CartScreenWidget({
    super.key,
  });

  @override
  State<CartScreenWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<CartScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<ShopStateModel>(
        builder: (context, value, child) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (value.selectedItems.isNotEmpty) {
                value.clearCart();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AfterPurchaseWidget(),
                  ),
                );
              }
            },
            label: Text('Оформити замовлення: ${value.sumDisplay} UAH',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
            backgroundColor: value.selectedItems.isEmpty
                ? const Color.fromARGB(255, 102, 102, 102)
                : const Color.fromARGB(255, 215, 9, 9),
          );
        },
      ),
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              expandedHeight: 150,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('assets/img/apple_sliver.png'),
                ),
              ),
            ),
            Consumer<ShopStateModel>(
              builder: (context, value, child) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return value.selectedItems.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 24.0, left: 12.0, right: 12.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 43, 38, 38)),
                              height: 200,
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                        "assets/img/${value.selectedItems[index].replaceAll(" ", "")}.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${value.selectedItems[index]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${value.selectedItemsPrice[index]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            value.deleteItem(index);
                                          },
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.black),
                                          ),
                                          child: const Text("Прибрати",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(top: 28.0),
                            child: Center(
                              child: Text(
                                "Ану бігом щось обирати!!!",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 20),
                              ),
                            ),
                          );
                  }),
                      childCount: value.selectedItems.isEmpty
                          ? 1
                          : value.selectedItems.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
