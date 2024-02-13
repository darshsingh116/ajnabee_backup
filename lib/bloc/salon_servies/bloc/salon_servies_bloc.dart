// import 'package:ajnabee/models/salon_services_model.dart';
// import 'package:ajnabee/repositories/firebase_repo.dart';
// import 'package:bloc/bloc.dart';
// part 'salon_servies_event.dart';
// part 'salon_servies_state.dart';

// class SalonServicesBloc extends Bloc<SalonServicesEvent, SalonServicesState> {
//   late List<SalonServicesModel> salonServicesList;

//   SalonServicesBloc() : super(SalonServicesInitial()) {
//     on<SalonServicesInitialize>((event, emit) async {
//       salonServicesList = await event.firebaseRepository.getSalonServices();
//       emit(SalonServicesInitialized(
//         salonServicesList: salonServicesList,
//       ));
//     });
//   }
// }
