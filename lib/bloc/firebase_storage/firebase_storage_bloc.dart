import 'dart:io' as io;
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ajnabee/bloc/firebase_storage/firebase_storage_event.dart';
import 'package:ajnabee/bloc/firebase_storage/firebase_storage_state.dart';
import 'package:ajnabee/repositories/firebase_storage_repo.dart';

class FirebaseStorageBloc
    extends Bloc<FirebaseStorageEvent, FirebaseStorageState> {
  FirebaseStorageBloc() : super(FirebaseStorageInitialState()) {
    //Events handlers here

    on<FirebaseStorageGetFilesListEvent>((event, emit) async {
      emit(FirebaseStorageLoadingState());
      ListResult futureFilesNameList =
          await firebaseGetFiles(event.firebaseStorageRepo);
      ListResult futurePreviewList =
          await firebaseGetPreviews(event.firebaseStorageRepo);
      List<String> previewsUrlList =
          await event.firebaseStorageRepo.getPreviewsurl(futurePreviewList);
      emit(FirebaseStorageDataLoadedState(
          filesNameList: futureFilesNameList, previewsUrlList: previewsUrlList));
    });

  }
}

Future<ListResult> firebaseGetFiles(
    FirebaseStoreageRepo firebaseStoreageRepo) async {
  Future<ListResult> futureFiles = firebaseStoreageRepo.getPdfList();
  return futureFiles;
}

Future<ListResult> firebaseGetPreviews(
    FirebaseStoreageRepo firebaseStoreageRepo) async {
  Future<ListResult> futureFiles = firebaseStoreageRepo.getPreviewsList();
  return futureFiles;
}
