import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  AnimationController _controller;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  set controller(AnimationController value) {
    this._controller = value;
  }

  set playing(bool value) {
    this._playing = value;
    notifyListeners();
  }

  set songDuration(Duration value) {
    this._songDuration = value;
    notifyListeners();
  }

  set current(Duration value) {
    this._current = value;
    notifyListeners();
  }

  Duration get songDuration => this._songDuration;

  Duration get current => this._current;

  AnimationController get controller => this._controller;

  bool get playing => this._playing;

  double get procentaje => (this._songDuration.inSeconds > 0) ? this._current.inSeconds / this._songDuration.inSeconds : 0;

  String get songTotalDuration => this.printDuration(this._songDuration);

  String get songCurrent => this.printDuration(this._current);

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
