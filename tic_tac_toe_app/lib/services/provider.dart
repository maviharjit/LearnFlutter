import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe_app/services/alert.dart';
import 'package:tic_tac_toe_app/services/board.dart';
import 'package:tic_tac_toe_app/services/sound.dart';

// simple and easy to use service locator. but what is a service locator?
GetIt locator = GetIt();

// what is happening here?
void setupLocator(){
  locator.registerSingleton(BoardService());
  locator.registerSingleton(SoundService());
  locator.registerSingleton(AlertService());
}
