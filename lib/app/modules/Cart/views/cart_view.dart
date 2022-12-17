import 'package:car_enthusiast/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontFamily: 'KanitEB'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff19DE21),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const NetworkImage(
                      "https://i.ibb.co/5xh0jrf/istrfry-marcus-9m-QHr1-Ws-EK0-unsplash-1.png",
                    ),
                  ),
                  title: const Text("Rocket Bunny Body Kits"),
                  subtitle: const Text("704,74 USD"),
                  trailing: SizedBox(
                    width: 150.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          color: Colors.grey[800],
                          child: IconButton(
                            iconSize: 20,
                            onPressed: _decrementCounter,
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$_counter",
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          color: Colors.grey[800],
                          child: IconButton(
                            onPressed: _incrementCounter,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add To',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff19DE21)),
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff19DE21)),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    width: 226,
                    height: 60,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Color(0xff19DE21)),
                        onPressed: () {
                          Get.to(() => convexbottombar(),
                              transition: Transition.zoom,
                              duration: Duration(seconds: 1));
                        },
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// class CartView extends GetView<CartController> {
//   const CartView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
