import 'package:flutter/material.dart';

import '../landing_page.dart';
class PageNotFound extends StatefulWidget {
  const PageNotFound({super.key});

  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFDA19),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF808083)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/after_booking/pagenotfound.png"),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'No Appointment \n booked',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 28,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Book Now or wait in long queues!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 56,
                      width: 343,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => RootPage()));
                        },
                        child: Text(
                          'BOOK NOW',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFDA19),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
