import 'package:flutter/material.dart';

class SalonDetails extends StatelessWidget {
  const SalonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height, // Full screen height
            width: MediaQuery.of(context).size.width, // Full screen width
          ),
          child: Stack(
            children: [
              Positioned(
                left:10,
                top: 8, // Add a top position to position the image
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255,255), // Set your desired background color or remove for transparent background
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: const Color.fromRGBO(255, 214, 0, 1),
                    )
                  ),
                ),
              ),
              Positioned(
                left: 280,
                top:8, // Add a top position to position the image
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255), // Set your desired background color or remove for transparent background
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: const Color.fromRGBO(255, 0, 25, 1),
                    )
                  ),
                ),
              ),
              Positioned.fill(
                // Add a top position to position the image
                child: Center(
                  child: Image.asset('assets/shop_details/shop.png')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
