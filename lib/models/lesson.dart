class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',
    isCompleted: true,
    isPlaying: true,
    name: "Niçin Flutter Geliştirici",
  ),
  Lesson(
    duration: '10 min 11 sec',
    isCompleted: false,
    isPlaying: false,
    name: "Flutter Kurulum MacOs",
  ),
  Lesson(
    duration: '7 min',
    isCompleted: false,
    isPlaying: false,
    name: "Flutter Kurulum Windows",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Flutterda Widgetlara Giriş.",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: " Stateless Widgets Nedir?",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: " Statefull Widgets Nedir?",
  )
];
