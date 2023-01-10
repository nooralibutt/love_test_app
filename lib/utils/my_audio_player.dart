import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();

  static MyAudioPlayer get instance => _instance;

  MyAudioPlayer._();

  final AudioCache _audioCache = AudioCache(prefix: 'assets/audio/');
  AudioPlayer? _audioPlayer;
  AudioPlayer? _scratchingPlayer;

  Future<void> init() => _audioCache.loadAll([
        'call_opening.mp3',
      ]);

  Future<AudioPlayer> playRingtone() => _audioCache
      .loop('call_opening.mp3')
      .then((player) => _audioPlayer = player);

  void stopScratching() {
    _scratchingPlayer?.stop();
    _scratchingPlayer = null;
  }

  void stopRingtone() {
    _audioPlayer?.stop();
    _audioPlayer = null;
  }
}
