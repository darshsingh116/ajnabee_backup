// import 'package:ajnabee/screens/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFFFD600),
      ),
      backgroundColor: const Color(0xFFFFD600),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 8,
              ),
              child: IconButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFF1F1F1)),
                  fixedSize: MaterialStatePropertyAll(Size(48, 48)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width,
                  height: 32,
                  child: const Text(
                    'Shanaya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: 24,
                  child: const Text(
                    'samantha@leafvillage.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: 24,
                  child: const Text(
                    '0123456789',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Encode Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      side: MaterialStatePropertyAll(BorderSide(width: 1))),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 48,
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const _SVGButton(
                      name: "My Booking",
                      iconSVG: "assets/profile/my_bookings.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Previous Booking",
                      iconSVG: "assets/profile/previous_bookings.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Payments",
                      iconSVG: "assets/profile/payments.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Help and Support",
                      iconSVG: "assets/profile/help_support.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Register as Partner",
                      iconSVG: "assets/profile/partner.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "FAQ's",
                      iconSVG: "assets/profile/faq.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Share and Earn",
                      iconSVG: "assets/profile/share.svg",
                    ),
                    const SizedBox(height: 11),
                    const _SVGButton(
                      name: "Our Policies",
                      iconSVG: "assets/profile/policies.svg",
                    ),
                    const SizedBox(height: 55),
                    GestureDetector(
                      child: Container(
                        height: 52,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFD600),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
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
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}

class _SVGButton extends StatelessWidget {
  final String name;
  final String iconSVG;
  const _SVGButton({required this.name, required this.iconSVG});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 52,
        decoration: ShapeDecoration(
          color: const Color(0xFFEFEFEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 11,
            right: 16,
            bottom: 11,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(iconSVG),
              const SizedBox(width: 24),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.07,
                ),
              ),
              const Spacer(),
              SvgPicture.asset("assets/profile/next.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
