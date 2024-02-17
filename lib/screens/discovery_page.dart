import 'package:flutter/material.dart';

void showNearbyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Your bottom sheet content goes here
        padding: const EdgeInsets.only(top: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Nearby Salon List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(children: [
                  _buildnearbyyellowContainer(
                    text: "Haircut",
                  ),
                  const SizedBox(width: 2),
                  _buildnearbywhiteContainer(
                    text: "Nails",
                  ),
                  const SizedBox(width: 2),
                  _buildnearbyyellowContainer(
                    text: "Facial",
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 131,
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/salons/Image1.png",
                        height: 131,
                        width: 125,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 2),
                            child: Text(
                              "Hair,Facial",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Nunito Sans",
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 240, 40, 1),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 2),
                            child: Text(
                              "Looks Salon",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 2),
                            child: Text(
                              "CP,Near Khadi India,Cann.",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Nunito Sans",
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/misc/Star.png",
                                  height: 12.67,
                                  width: 13.64,
                                ),
                                const Text(
                                  "4.7",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ),
                                const Text(
                                  "(2.7k)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/misc/Heart.png",
                        height: 24,
                        width: 24,
                      )
                    ],
                  ),
                ),
              ),
            )
            // ListTile(
            //   title: Text('Option 1'),
            //   onTap: () {
            //     // Perform action for Option 1
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: Text('Option 2'),
            //   onTap: () {
            //     // Perform action for Option 2
            //     Navigator.pop(context);
            //   },
            // ),
            // Add more list tiles or widgets as needed
          ],
        ),
      );
    },
  );
}

Widget _buildnearbyyellowContainer({required String text}) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 88,
    height: 32,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 214, 0, 1),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center align content
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    ),
  );
}

Widget _buildnearbywhiteContainer({required String text}) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 88,
    height: 32,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color.fromRGBO(255, 220, 40, 1),
          width: 2,
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center align content
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(255, 240, 40, 1),
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    ),
  );
}
