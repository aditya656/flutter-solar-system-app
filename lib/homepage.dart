import 'package:solar_system/detail_page.dart';

import 'data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/constants.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -2.0),
            end: Alignment(0.0, 1.0),
            colors: [gradientStartColor, gradientEndColor],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 48,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 19,
                              color: const Color(0xffc7c7c7),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Container(
                height: 500,
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 40,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeSize: 20,
                          activeColor: Colors.grey[600],
                          space: 8)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) =>
                                    DetailPage(planetInfo: planets[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    color: cardColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 100),
                                          //planet name
                                          SizedBox(
                                            // width: 197.0,
                                            height: 67.0,
                                            child: Text(
                                              planets[index].name,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 48,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          //solar system text
                                          SizedBox(
                                            width: 197.0,
                                            height: 31.0,
                                            child: Text(
                                              'Solar System',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          //know more and arrow
                                          Row(
                                            children: [
                                              Text(
                                                'Know More ',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  color:
                                                      const Color(0xff929292),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(Icons.chevron_right),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                  height: 270,
                                  width: 400,
                                  child: Hero(tag: planets[index].position,child: Image.asset(planets[index].iconImage))),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: navigationColor,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: Image.asset('assets/menu_icon.png'), onPressed: () {}),
          IconButton(
              icon: Image.asset('assets/search_icon.png'), onPressed: () {}),
          IconButton(
              icon: Image.asset('assets/profile_icon.png'), onPressed: () {}),
        ]),
      ),
    );
  }
}
