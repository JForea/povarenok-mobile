String convertTime(int time) {
  int hours = time ~/ 60;
  int minutes = time % 60;
  String s = '';

  if (hours != 0) {
    s += '$hours час';
  }

  if (hours != 0) {
    if (hours ~/ 10 % 10 == 1 || hours % 10 >= 2) {
      s += 'ов ';
    } else {
      s += 'a ';
    }
  }

  if (minutes != 0) {
    s += '$minutes минут';

    if (minutes ~/ 10 % 10 != 1 && minutes % 10 == 1) {
      s += 'ы';
    }
  }

  return s;
}
