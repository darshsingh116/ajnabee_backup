import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              //HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Shanaya',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 24,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Find the service you want, and treat yourself',
                        style: TextStyle(
                          color: Color(0xFF50555C),
                          fontSize: 14,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              //PROMO
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 118,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 300,
                        height: 118,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 300,
                        height: 118,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Added Text widget aligned to the left
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What do you want to do?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Added GridView
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap action here
                      print('Tapped on item');
                      // Navigate to another screen, perform an action, etc.
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150, // Adjust the width as needed
                          height: 100, // Adjust the height as needed
                          child: Image.asset(
                            'assets/images/haircut.png',
                            
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Haircut', // Replace with your text
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
