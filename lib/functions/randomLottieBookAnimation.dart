import 'dart:math';

getRandomBookAnimation() {
  return 'assets/lottie/book${1+Random().nextInt(4)}.json';
}
