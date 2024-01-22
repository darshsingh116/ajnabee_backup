import 'package:flutter/material.dart';
import 'package:ajnabee/screens/homepage.dart';

class BookingDone extends StatelessWidget {
  const BookingDone({Key? key});

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
                    Image.asset("assets/after_booking/done.png"),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Your Services have \n been booked',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 40,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Now Relax and leave the hassle on us',
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
                          'HOME',
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
