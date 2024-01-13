import 'package:ajnabee/bloc/home/bloc/home_bloc.dart';
import 'package:ajnabee/models/salon_model.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:ajnabee/screens/salon_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/category_button.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseRepository = context.read<FirebaseRepository>();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              context.read<HomeBloc>().add(
                  HomeEventInitialize(firebaseRepository: firebaseRepository));
            }
            return SingleChildScrollView(
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
                              (MediaQuery.sizeOf(context).width - 80) /
                                  (4 * 91),
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

                  // //SALON YOU FOLLOW
                  // SizedBox(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 8,
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         const Padding(
                  //           padding: EdgeInsets.symmetric(
                  //             horizontal: 16,
                  //           ),
                  //           child: Text(
                  //             'Salon you follow',
                  //             style: TextStyle(
                  //               color: Color(0xFF111111),
                  //               fontSize: 16,
                  //               fontFamily: 'Manrope',
                  //               fontWeight: FontWeight.w700,
                  //               height: 0,
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 24),
                  //         SingleChildScrollView(
                  //           scrollDirection: Axis.horizontal,
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //               horizontal: 16,
                  //             ),
                  //             child: Row(
                  //               children: List.generate(
                  //                 5,
                  //                 (index) {
                  //                   return Row(
                  //                     children: <Widget>[
                  //                       Image.asset(
                  //                         "assets/stories/Story ${index + 1}.png",
                  //                         fit: BoxFit.fill,
                  //                       ),
                  //                       const SizedBox(width: 8),
                  //                     ],
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(height: 16),

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
                        SizedBox(
                          height: 320,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                if (state is HomeStateInitialized) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                16.0), // Adjust spacing between cards
                                        child: GestureDetector(child: FeaturedSalonCard(context,state.salonModelList[index]),
                                        onTap: () {
                                          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SalonDetails(salonModel: state.salonModelList[index],)),
        );
                                        },),
                                      );
                                    },
                                  );
                                }

                                return Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      strokeWidth:
                                          8.0, // Increase the strokeWidth for a larger loader
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 206, 255,
                                              68)), // Set the color to black
                                    ),
                                  ),
                                );
                              },
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
                            child: Row(children: [
                              _buildInterestContainer(
                                imagePath: "assets/categories/haircut.png",
                                text: "Haircut",
                              ),
                              const SizedBox(width: 5),
                              _buildInterestContainer(
                                imagePath: "assets/categories/nails.png",
                                text: "Nails",
                              ),
                              const SizedBox(width: 5),
                              _buildInterestContainer(
                                imagePath: "assets/categories/facial.png",
                                text: "Facial",
                              ),
                            ]),
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
            );
          },
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
          onTap: (int index) {
            if (index == 1) {
              _showNearbyBottomSheet(context);
            }
          },
        ));
  }

  Widget _buildInterestContainer(
      {required String imagePath, required String text}) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 146,
      height: 56,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(225, 245, 250, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align content
        children: [
          Image.asset(
            imagePath,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: const Color.fromRGBO(255, 214, 0, 1),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ],
      ),
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
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
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
            style: TextStyle(
              color: const Color.fromRGBO(255, 240, 40, 1),
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

  void _showNearbyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Your bottom sheet content goes here
          padding: EdgeInsets.only(top: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
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
                          offset: Offset(0, 2),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 2),
                              child: Text(
                                "Hair,Facial",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Nunito Sans",
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 240, 40, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 2),
                              child: Text(
                                "Looks Salon",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Manrope",
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 2),
                              child: Text(
                                "CP,Near Khadi India,Cann.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Nunito Sans",
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/misc/Star.png",
                                    height: 12.67,
                                    width: 13.64,
                                  ),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Manrope",
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  Text(
                                    "(2.7k)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Manrope",
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
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

  Widget FeaturedSalonCard(BuildContext context, SalonModel salon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset("assets/salons/Image1.png"),
        const SizedBox(height: 16),
        Text(
          "salon.services",
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
        Text(
          salon.name,
          style: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          salon.address,
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
            Text(
              salon.rating.toString(),
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '(4k)',
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
    );
  }
}
