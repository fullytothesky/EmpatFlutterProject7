import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/models/shop_state_model.dart';

class DeviceAnimatedScreen extends StatefulWidget {
  final String passedName;
  final double passedPrice;
  final String passedCategory;

  DeviceAnimatedScreen({
    Key? key,
    required this.passedName,
    required this.passedPrice,
    required this.passedCategory,
  }) : super(key: key);

  @override
  _DeviceAnimatedScreenState createState() => _DeviceAnimatedScreenState();
}

class _DeviceAnimatedScreenState extends State<DeviceAnimatedScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween: ColorTween(begin: Colors.black, end: Colors.black),
          weight: 1.0,
        ),
      ],
    ).animate(_colorController); // підключаю анімацію до контроллеру

    _colorController.forward();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    String formattedPrice = widget.passedPrice.toStringAsFixed(3);
    String formattedName = widget.passedName.replaceAll(' ', '');

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, 10.0 * _animation.value),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: formattedName,
                          child: Image(
                            image: AssetImage("assets/img/$formattedName.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, left: 15, right: 15),
                          child: Text(
                            widget.passedName,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 27,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 2, left: 15, right: 15),
                          child: Text(
                            "$formattedPrice UAH",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        widget.passedCategory == "Headphones"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10),
                                    child: Consumer<ShopStateModel>(
                                        builder: (context, value, child) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          value.addItem(
                                            widget.passedName,
                                            widget.passedPrice,
                                          );
                                        },
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Color.fromARGB(248, 203, 43, 8),
                                          ),
                                        ),
                                        child: Text(
                                          value.selectedItems
                                                  .contains(widget.passedName)
                                              ? "Додано: ${value.selectedItems.where((element) => element == widget.passedName).length}"
                                              : "У кошик",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              )
                            : widget.passedCategory == "Laptops"
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 15, right: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "512 GB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "1 TB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                193, 181, 181),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                117, 246, 129),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 117, 246, 129),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                126, 177, 218),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 126, 177, 218),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                          child: Consumer<ShopStateModel>(
                                              builder: (context, value, child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                value.addItem(
                                                  widget.passedName,
                                                  widget.passedPrice,
                                                );
                                              },
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      248, 203, 43, 8),
                                                ),
                                              ),
                                              child: Text(
                                                value.selectedItems.contains(
                                                        widget.passedName)
                                                    ? "Додано: ${value.selectedItems.where((element) => element == widget.passedName).length}"
                                                    : "У кошик",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 15, right: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "128 GB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "256 GB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "512 GB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "1 TB",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                74, 71, 71),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 74, 71, 71),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                193, 181, 181),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                            begin: Colors.black,
                                                            end: const Color
                                                                .fromARGB(255,
                                                                117, 246, 129),
                                                          ),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 117, 246, 129),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    //оновлюю анімацію
                                                    _colorAnimation =
                                                        TweenSequence<Color?>(
                                                      [
                                                        TweenSequenceItem(
                                                          tween: ColorTween(
                                                              begin:
                                                                  Colors.black,
                                                              end: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  126,
                                                                  177,
                                                                  218)),
                                                          weight: 1.0,
                                                        ),
                                                      ],
                                                    ).animate(_colorController);
                                                    _colorController.forward(
                                                        from: 0);
                                                  });
                                                },
                                                child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 126, 177, 218),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0, top: 8.0),
                                          child: Consumer<ShopStateModel>(
                                              builder: (context, value, child) {
                                            return ElevatedButton(
                                              onPressed: () {
                                                value.addItem(
                                                  widget.passedName,
                                                  widget.passedPrice,
                                                );
                                              },
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      248, 203, 43, 8),
                                                ),
                                              ),
                                              child: Text(
                                                value.selectedItems.contains(
                                                        widget.passedName)
                                                    ? "Додано: ${value.selectedItems.where((element) => element == widget.passedName).length}"
                                                    : "У кошик",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose(); // звільнення ресурсів
    super.dispose();
  }
}
