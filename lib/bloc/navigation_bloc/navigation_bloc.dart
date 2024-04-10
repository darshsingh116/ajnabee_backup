import 'package:bloc/bloc.dart';

List navIcon = [home, discovery, calendar, inbox, profile];

class NavigationInfoModel {
  final int index;
  List isNotification;

  NavigationInfoModel({
    required this.index,
    required this.isNotification,
  });
}

abstract class NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToDiscovery extends NavigationEvent {}

class NavigateToCalendar extends NavigationEvent {}

class NavigateToInbox extends NavigationEvent {}

class NavigateToProfile extends NavigationEvent {}

// Define states for the navigation bar
abstract class NavigationState {
  NavigationInfoModel info;
  NavigationState({required this.info});
}

class HomeNavigationState extends NavigationState {
  HomeNavigationState({required super.info});
}

class DiscoveryNavigationState extends NavigationState {
  DiscoveryNavigationState({required super.info});
}

class CalendarNavigationState extends NavigationState {
  CalendarNavigationState({required super.info});
}

class InboxNavigationState extends NavigationState {
  InboxNavigationState({required super.info});
}

class ProfileNavigationState extends NavigationState {
  ProfileNavigationState({required super.info});
}

List isNotification = [3, 4];

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(HomeNavigationState(
          info: NavigationInfoModel(
            index: 0,
            isNotification: isNotification,
          ),
        )) {
    on<NavigateToHome>((event, emit) {
      isNotification.remove(0);
      emit(HomeNavigationState(
        info: NavigationInfoModel(
          index: 0,
          isNotification: isNotification,
        ),
      ));
    });
    on<NavigateToDiscovery>((event, emit) {
      isNotification.remove(1);
      emit(DiscoveryNavigationState(
        info: NavigationInfoModel(
          index: 1,
          isNotification: isNotification,
        ),
      ));
    });
    on<NavigateToCalendar>((event, emit) {
      isNotification.remove(2);
      emit(CalendarNavigationState(
        info: NavigationInfoModel(
          index: 2,
          isNotification: isNotification,
        ),
      ));
    });
    on<NavigateToInbox>((event, emit) {
      isNotification.remove(3);
      emit(InboxNavigationState(
        info: NavigationInfoModel(
          index: 3,
          isNotification: isNotification,
        ),
      ));
    });
    on<NavigateToProfile>((event, emit) {
      isNotification.remove(4);
      emit(ProfileNavigationState(
        info: NavigationInfoModel(
          index: 4,
          isNotification: isNotification,
        ),
      ));
    });
  }
}

const home = "assets/navbar/home.svg";
const discovery = "assets/navbar/discovery.svg";
const calendar = "assets/navbar/calender.svg";
const inbox = "assets/navbar/inbox.svg";
const profile = "assets/navbar/profile.svg";
const ellipse = "assets/navbar/ellipse.svg";
const notificationDot = "assets/navbar/notification_dot.svg";
const double kNavBarHeight = 72;
