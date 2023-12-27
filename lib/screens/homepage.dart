import 'package:flutter/material.dart';

import '../components/category_button.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 24),

              //HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
              ),

              const SizedBox(height: 16),

              //PROMO
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 320,
                        height: 118,
                        child: Image.asset(
                          "assets/cards/Card.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 320,
                        height: 118,
                        child: Image.asset(
                          "assets/cards/Card.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 320,
                        height: 118,
                        child: Image.asset(
                          "assets/cards/Card.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // CATEGORIES
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'What do you want to do?',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio:
                          (MediaQuery.sizeOf(context).width - 80) / (4 * 91),
                      children: <Widget>[
                        CategoryButton(
                          title: "Haircut",
                          asset: "assets/categories/haircut.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Nails",
                          asset: "assets/categories/nails.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Facial",
                          asset: "assets/categories/facial.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Coloring",
                          asset: "assets/categories/coloring.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Spa",
                          asset: "assets/categories/spa.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Waxing",
                          asset: "assets/categories/waxing.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Makeup",
                          asset: "assets/categories/makeup.png",
                          onTap: () {},
                        ),
                        CategoryButton(
                          title: "Massage",
                          asset: "assets/categories/massage.png",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //SALON YOU FOLLOW
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        'Salon you follow',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/stories/Story ${index + 1}.png",
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //FEATURED SALON
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Featured Salon',
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            'View all',
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFFFD600),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  "assets/salons/Image1.png",
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Hair . Nails . Facial',
                                  style: TextStyle(
                                    color: Color(0xFFFFD600),
                                    fontSize: 12,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.36,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Lakmé',
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 16,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'G 90, Ground Floor, V3S ...',
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontSize: 14,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/misc/Star.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '4.8',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 12,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '(3.1k)',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 12,
                                        fontFamily: 'Nunito Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.36,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  "assets/salons/Image2.png",
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Hair . Facial . 2+',
                                  style: TextStyle(
                                    color: Color(0xFFFFD600),
                                    fontSize: 12,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.36,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'TRUEFITT & HILL',
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 16,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Ground Floor, Shop No.10, ...',
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontSize: 14,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/misc/Star.png",
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '4.7',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 12,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '(2.7k)',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 12,
                                        fontFamily: 'Nunito Sans',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.36,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //MOST SEARCH INTEREST
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          'Most Search Interest',
                          style: TextStyle(
                            color: Color(0xFF111111),
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
                        child: Row(
                          children: List.generate(
                            3,
                            (index) {
                              return const Row(
                                children: <Widget>[
                                  //START HERE
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //NEARBY OFFERS
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nearby Offers',
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            'View all',
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFFFD600),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: List.generate(
                            3,
                            (index) {
                              return const Row(
                                children: <Widget>[
                                  //START HERE
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          fixedColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                color: Colors.amber,
              ),
              label: "Nearby",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.amber,
              ),
              label: "Appointment",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox,
                color: Colors.amber,
              ),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.amber,
              ),
              label: "Profile",
            ),
          ],
        ));
  }
}
