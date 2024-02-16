import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int isSelected = 0;
  List isNotification = [3, 4];

  @override
  Widget build(BuildContext context) {
    // BottomNavigationBar;
    // NavigationBar;
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Container(
        height: kNavBarHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A2B2B2B),
              blurRadius: 0,
              offset: Offset(0, -1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: ListView.builder(
                itemCount: icon.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _navBarDestination(
                  index: index,
                  width: width,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _navBarDestination({
    required int index,
    required double width,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width / icon.length,
          maxHeight: kNavBarHeight,
        ),
        child: IconButton(
          isSelected: isSelected == index,
          icon: _icon(index),
          selectedIcon: _selectedIcon(index),
          onPressed: () {
            setState(() {
              isSelected = index;
              isNotification.remove(index);
            });
          },
        ),
      ),
    );
  }

  Widget _icon(int index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          icon[index],
          height: 24,
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Builder(
            builder: (context) {
              if (isNotification.contains(index)) {
                return SvgPicture.asset(notificationDot);
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }

  Widget _selectedIcon(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          icon[index],
          height: 24,
          colorFilter: const ColorFilter.mode(
            Color(0xFFFFD600),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 11),
        SvgPicture.asset(ellipse)
      ],
    );
  }
}

const icon = [
  home,
  discovery,
  calender,
  inbox,
  profile,
];
const home = "assets/navbar/home.svg";
const discovery = "assets/navbar/discovery.svg";
const calender = "assets/navbar/calender.svg";
const inbox = "assets/navbar/inbox.svg";
const profile = "assets/navbar/profile.svg";
const ellipse = "assets/navbar/ellipse.svg";
const notificationDot = "assets/navbar/notification_dot.svg";
const double kNavBarHeight = 72;
