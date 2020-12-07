import 'package:rxdart/rxdart.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class SoundService {

  BehaviorSubject<bool> _enableSounds;

  BehaviorSubject<bool> get enableSounds =>
      _enableSounds;
  AudioPlayer _fixedPlayer;
  AudioCache _player;

  SoundService() {
    _enableSounds = BehaviorSubject<bool>.seeded(true);
    _fixedPlayer = AudioPlayer(mode:
    PlayerMode.LOW_LATENCY);
    _player = AudioCache(fixedPlayer: _fixedPlayer);
    _player.loadAll(['x.mp3', 'o.mp3', 'click.mp3']);
  }

  playSound(String sound) {
    bool isSoundEnabled = _enableSounds.value;
    if (isSoundEnabled) {
      _player.play("$sound.mp3");
    }
  }
}