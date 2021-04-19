import 'package:flutter/material.dart';
import 'package:solar_system/constants.dart';
import 'package:solar_system/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Stack(
        children: [
          Positioned(
              top: 20,
              right: -64,
              child: Hero(
                  tag: planetInfo.position,
                  child: Image.asset(planetInfo.iconImage))),
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        SizedBox(
                          width: 197.0,
                          height: 67.0,
                          child: Text(
                            planetInfo.name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 48,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            color: const Color(0xffc7c7c7),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          planetInfo.description ?? '',
                          // maxLines: 5,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 19,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15),
                        Divider(color: Colors.white),
                        SizedBox(height: 15),
                        SizedBox(
                          width: 197.0,
                          height: 67.0,
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 37,
                              color: const Color(0xffe7e7e7),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                              itemCount: planetInfo.images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(
                                        planetInfo.images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ));
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
