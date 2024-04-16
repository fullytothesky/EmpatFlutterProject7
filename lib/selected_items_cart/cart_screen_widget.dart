import 'package:flutter/material.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:sixth_state2_project/shop_screen/after_purchase_screen.dart';
import 'package:sixth_state2_project/models/shop_state_model.dart';
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
        builder: (
          context,
          value,
          child,
        ) {
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
            label: Text(
              'Оформити замовлення: ${value.sumDisplay} UAH',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: value.selectedItems.isEmpty
                ? const Color.fromARGB(255, 102, 102, 102)
                : const Color.fromARGB(255, 215, 9, 9),
          );
        },
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Color.fromARGB(255, 186, 176, 176),
            expandedHeight: 150,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/img/apple_sliver.png'),
              ),
            ),
          ),
          Consumer<ShopStateModel>(
            builder: (
              context,
              value,
              child,
            ) {
              var theme = Provider.of<PreferencesStateModel>(
                context,
                listen: true,
              ).savedTheme;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    return value.selectedItems.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 24.0,
                              left: 12.0,
                              right: 12.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: theme == 'light'
                                    ? const Color.fromARGB(255, 181, 180, 176)
                                    : const Color.fromARGB(255, 43, 38, 38),
                              ),
                              height: 200,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        "assets/img/${value.selectedItems[index].replaceAll(
                                          " ",
                                          "",
                                        )}.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                          ),
                                          child: Text(
                                            '${value.selectedItems[index]}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: theme == 'light'
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${value.selectedItemsPrice[index]} UAH',
                                          style: TextStyle(
                                              color: theme == 'light'
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            value.deleteItem(index);
                                          },
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              Colors.black,
                                            ),
                                          ),
                                          child: const Text(
                                            "Прибрати",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(
                              top: 28.0,
                            ),
                            child: Center(
                              child: Text(
                                "Оберіть, будь ласка, товар",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                  }),
                  childCount: value.selectedItems.isEmpty
                      ? 1
                      : value.selectedItems.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
