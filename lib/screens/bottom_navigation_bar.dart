import 'package:ajnabee/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:ajnabee/screens/discovery_page.dart';
import 'package:ajnabee/screens/landing_page.dart';
import 'package:ajnabee/screens/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
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
                    itemCount: navIcon.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _navBarDestination(
                      context: context,
                      index: index,
                      width: width,
                      state: state,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navBarDestination({
    required BuildContext context,
    required int index,
    required double width,
    required NavigationState state,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width / navIcon.length,
          maxHeight: kNavBarHeight,
        ),
        child: IconButton(
          isSelected: state.info.index == index,
          icon: _icon(index, state),
          selectedIcon: _selectedIcon(index),
          onPressed: () {
            final NavigationEvent event;
            switch (index) {
              case 0:
                event = NavigateToHome();
                BlocProvider.of<NavigationBloc>(context).add(event);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RootPage(),
                    ));
                break;
              case 1:
                event = NavigateToDiscovery();
                BlocProvider.of<NavigationBloc>(context).add(event);
                showNearbyBottomSheet(context);
                break;
              case 2:
                event = NavigateToCalendar();
                BlocProvider.of<NavigationBloc>(context).add(event);
                break;
              case 3:
                event = NavigateToInbox();
                BlocProvider.of<NavigationBloc>(context).add(event);
                break;
              case 4:
                event = NavigateToProfile();
                BlocProvider.of<NavigationBloc>(context).add(event);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyProfile(),
                    ));
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _icon(int index, NavigationState state) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          navIcon[index],
          height: 24,
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Builder(
            builder: (context) {
              if (state.info.isNotification.contains(index)) {
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
          navIcon[index],
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
