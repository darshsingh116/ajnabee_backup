part of 'home_bloc.dart';

abstract class HomeEvent{
  const HomeEvent();
}

class HomeEventInitialize extends HomeEvent {
  final FirebaseRepository firebaseRepository;

  HomeEventInitialize({required this.firebaseRepository});
}
