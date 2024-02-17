import 'package:flutter/material.dart';

void showNearbyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    backgroundColor: Colors.white,
    showDragHandle: true,
    barrierColor: Color(0x7F565B63),
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Nearby Salon List',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )),
            const SizedBox(height: 24),
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
                  const SizedBox(width: 8),
                  _buildnearbywhiteContainer(
                    text: "Nails",
                  ),
                  const SizedBox(width: 8),
                  _buildnearbyyellowContainer(
                    text: "Facial",
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            _card(context),
            const SizedBox(height: 8),
            _card(context),
            const SizedBox(height: 8),
            _card(context),
            const SizedBox(height: 8),
            _card(context),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

Widget _card(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 131,
        // width: 343,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3FCDCDCD),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
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
  );
}

Widget _buildnearbyyellowContainer({required String text}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 32,
      vertical: 8,
    ),
    decoration: ShapeDecoration(
      color: const Color(0xFFFFD600),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFFFD600)),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    ),
  );
}

Widget _buildnearbywhiteContainer({required String text}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 32,
      vertical: 8,
    ),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFFFDC27)),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xFFFFD600),
        fontSize: 12,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    ),
  );
}
