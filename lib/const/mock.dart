import 'dart:math';

const randomWords = [
  "rabbit",
  "carrot",
  "apple",
  "fire",
  "water",
  "earth",
  "tv",
  "phone",
  "christmas",
  "flower"
];

String randomMockString(int wordCount) {
  final random = Random();
  return List.generate(wordCount, (index) {
    return randomWords[random.nextInt(randomWords.length)];
  }).join(" ");
}
