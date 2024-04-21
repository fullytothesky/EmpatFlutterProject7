import 'package:flutter/material.dart';
import 'package:sixth_state2_project/service.dart';

class AccessoriesWidget extends StatelessWidget {
  const AccessoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/news');
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/apple_news.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                      child: Text(
                        "Apple Новини",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ServiceWidget(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/trade_in.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                        right: 10.0,
                      ),
                      child: Text(
                        "Сервіси",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
