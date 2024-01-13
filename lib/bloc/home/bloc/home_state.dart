// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeStateInitialized extends HomeState {
  List<SalonModel> salonModelList;
  HomeStateInitialized({
    required this.salonModelList,
  });
}

class HomeStateSalonListLoading extends HomeState{}
