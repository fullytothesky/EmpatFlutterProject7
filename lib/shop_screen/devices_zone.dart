import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sixth_state2_project/shop_state_model.dart';

class DevicesZone extends StatelessWidget {
  const DevicesZone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopStateModel>(
      builder: (context, value, child) {
        return Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, left: 15),
                          child: Text(
                            "Для балакучок у Slack",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: const Color.fromARGB(166, 30, 75, 66),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                itemBuilder(context, "Apple iPhone 15", 34.999),
                                itemBuilder(
                                    context, "Apple iPhone 15 Pro ", 53.000),
                                itemBuilder(
                                    context, "Apple iPhone 15 Pro Max", 48.999),
                                itemBuilder(context, "Apple iPhone 13", 30.999),
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
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, left: 15),
                            child: Text(
                              "Ноутбуки для домашок",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: const Color.fromARGB(166, 30, 75, 66),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  itemBuilder(
                                      context, "MacBook Air 13", 34.999),
                                  itemBuilder(
                                      context, "MacBook Air 15", 53.999),
                                  itemBuilder(
                                      context, "MacBook Pro 14", 48.999),
                                  itemBuilder(
                                      context, "MacBook Pro 16", 30.999),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                  child: Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, left: 15),
                            child: Text(
                              "Навушники для лекцій Сергія",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: const Color.fromARGB(166, 30, 75, 66),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  itemBuilder(
                                      context, "Apple AirPods Pro", 9.999),
                                  itemBuilder(
                                      context, "Apple AirPods Max", 22.999),
                                  itemBuilder(
                                      context, "Apple AirPods 3", 10.999),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
            duration: const Duration(milliseconds: 800),
            height: value.selectedItems.contains(name) ? 190 : 170,
            decoration: BoxDecoration(
                color: value.selectedItems.contains(name)
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.black26),
            child: Row(
              children: [
                Image(
                  image: AssetImage("assets/img/$formattedName.jpg"),
                  fit: BoxFit.cover,
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
                            color: value.selectedItems.contains(name)
                                ? Colors.black
                                : Colors.white),
                      ),
                      Text(
                        "$formattedPrice UAH",
                        style: TextStyle(
                            fontSize: 20,
                            color: value.selectedItems.contains(name)
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          value.addItem(name, price);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(248, 203, 43, 8)),
                        ),
                        child: Text(
                          value.selectedItems.contains(name)
                              ? "Додано: ${value.selectedItems.where((element) => element == name).length}"
                              : "У кошик",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
