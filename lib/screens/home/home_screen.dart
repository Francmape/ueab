import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _iconWidget({required String iconPath, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor, // Button color
            child: InkWell(
              splashColor: Colors.blue[400], // Splash color

              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                child: Center(
                  child: new Image.asset(
                    iconPath,
                    color: Colors.white,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 13.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 100.0),
              // RECENT PAYMENTS
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                height: 270,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 50),
                            Text(
                              'RECENT PAYMENTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.more_horiz),
                            SizedBox(width: 1),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        // Expanded(
                        //   child: ListView.builder(
                        //     padding: EdgeInsets.zero,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemCount: 2,
                        //     itemBuilder: (context, index) => BillItem(
                        //       bill: BillsData[index],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              // FAVORITES
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 130,
                child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Theme.of(context)
                                      .primaryColor, // Button color
                                  child: InkWell(
                                    splashColor:
                                        Colors.blue[400], // Splash color
                                    onTap: () {},
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'My Favorites',
                                style: TextStyle(fontSize: 13.0),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Theme.of(context)
                                      .primaryColor, // Button color
                                  child: InkWell(
                                    splashColor:
                                        Colors.blue[400], // Splash color
                                    onTap: () {},
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          Icons.compare_arrows,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Payment History',
                                style: TextStyle(fontSize: 13.0),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Theme.of(context)
                                      .primaryColor, // Button color
                                  child: InkWell(
                                    splashColor:
                                        Colors.blue[400], // Splash color
                                    onTap: () {},
                                    child: const SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          Icons.attach_money,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Pay',
                                style: TextStyle(fontSize: 13.0),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              // SERVICES
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            children: [
                              _iconWidget(
                                  iconPath: 'assets/images/icon_home.png',
                                  text: 'Rent'),
                              _iconWidget(
                                  iconPath: 'assets/images/icon_internet.png',
                                  text: 'Internet'),
                              _iconWidget(
                                  iconPath:
                                      'assets/images/icon_electricity.png',
                                  text: 'Electricity'),
                              _iconWidget(
                                  iconPath: 'assets/images/icon_water.png',
                                  text: 'Water'),
                              _iconWidget(
                                  iconPath: 'assets/images/icon_movers.png',
                                  text: 'Movers'),
                              _iconWidget(
                                  iconPath: 'assets/images/icon_laundry.png',
                                  text: 'Laundry'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 35.0, bottom: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [Text('Other Services...')],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
