import 'package:get_it/get_it.dart';
import 'package:provider_base/dao/note_dao.dart';
import 'package:provider_base/dao/user_dao.dart';
import 'package:provider_base/service/note_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton<UserDao>(() =>UserDao());
  locator.registerLazySingleton<NoteDao>(() => NoteDao());
  locator.registerLazySingleton<NoteService>(() => NoteService());
}
