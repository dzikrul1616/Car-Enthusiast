import 'package:car_enthusiast/app/modules/Profil/views/profil_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_controller.dart';

class convexbottombar extends StatefulWidget {
  convexbottombar({Key? key}) : super(key: key);

  @override
  State<convexbottombar> createState() => _convexbottombarState();
}

class _convexbottombarState extends State<convexbottombar> {
  final _pgno = [HomeView(), ProfilView()];

  int _pilihtabbar = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void _changetabbar(int index) {
    setState(() {
      _pilihtabbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pgno[_pilihtabbar],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.car_repair,
                  text: 'Car Ite',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _pilihtabbar,
              onTabChange: (index) {
                setState(() {
                  _pilihtabbar = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(children: [
        const SizedBox(
          height: 40.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 12.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[400]!,
            ),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Expanded(
                child: TextFormField(
                  initialValue: null,
                  decoration: const InputDecoration.collapsed(
                      filled: true,
                      fillColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      hintText: "Search",
                      hintStyle: TextStyle(fontFamily: 'Kanit')),
                  onFieldSubmitted: (value) {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 100.0,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff19DE21),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Categori ${index + 1}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        fontFamily: 'Kanit'),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Builder(
          builder: (context) {
            List items = [
              {
                "id": 1,
                "photo":
                    "https://i.ibb.co/19nQxhQ/erik-mclean-ZRns2-R5azu0-unsplash.png",
                "onTap": (item) {},
              },
              {
                "id": 2,
                "photo":
                    "https://i.ibb.co/f8RWPZW/Modified-Bmw-E30-M3-Evo-Dtm-Sony-Xperia-X-XZ-Z5-Pr-1.png",
                "onTap": (item) {},
              },
              {
                "id": 3,
                "photo":
                    "https://i.ibb.co/HgBhPdG/haidong-liang-hc-YPu-Ek-X5-Bc-unsplash-1-1.png",
                "onTap": (item) {},
              }
            ];

            return SizedBox(
              height: 120.0,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          item["photo"],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Top Seller',
          style: TextStyle(
              fontSize: 25, fontFamily: 'KanitEB', color: Color(0xff19DE21)),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/60QTbgs/bereczki-domokos-qki-Nciu69t-Y-unsplash-1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.blue[400],
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            12.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Top",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          "Rocket Bunny Body Kits",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          'Recomended',
          style: TextStyle(
              fontSize: 25, fontFamily: 'KanitEB', color: Color(0xff19DE21)),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 140.0,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/5xh0jrf/istrfry-marcus-9m-QHr1-Ws-EK0-unsplash-1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.blue[400],
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            12.0,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Promo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          "Rocket Bunny Body Kits - Nissan GTR 35R 2018 PnP (Build In)",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    )));
  }
}
