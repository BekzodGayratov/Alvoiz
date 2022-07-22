import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static List<String> soundsPath = [
    "sounds/bismillah.mp3",
    "sounds/amallar.mp3",
    "sounds/qizfarzand.mp3",
    "sounds/taqvo.mp3",
  ];

  static List<String> soundsTitles = [
    "Bismillah ta'rifi",
    "Amallar niyyatga bog'liqdir",
    "Qiz farzand qadri",
    "Taqvo"
  ];

  static List<bool> soundsStatus =
      List.generate(soundsPath.length, (index) => false);

  static AudioPlayer audioPlayer = AudioPlayer();
  static PlayerState audioState = PlayerState.paused;
  static AudioCache? audioCache;

  static play(String path) async {
    await audioPlayer.play(AssetSource(path));
    audioState = PlayerState.playing;
  }

  static pause() async {
    await audioPlayer.pause();
    audioState = PlayerState.paused;
  }

  static back(String path) async {
    await audioPlayer.play(AssetSource(path));
    audioState = PlayerState.playing;
  }

  static next(String path) async {
    await audioPlayer.play(AssetSource(path));
    audioState = PlayerState.playing;
  }

  static stop() async {
    await audioPlayer.stop();
    audioState = PlayerState.stopped;
  }
}
