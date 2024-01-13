import 'package:ajnabee/models/salon_model.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  late List<SalonModel> salonModelList;


  HomeBloc() : super(HomeInitial()) {
      on<HomeEventInitialize>((event, emit) async {
      salonModelList = await event.firebaseRepository.getSalons();
      emit(HomeStateInitialized(salonModelList: salonModelList));
    });
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
