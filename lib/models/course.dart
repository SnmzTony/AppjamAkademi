class Course {
  String name;
  double completedPercentage;
  String tamamlanan;
  String thumbnail;

  Course({
    required this.tamamlanan,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    tamamlanan: "Ders",
    completedPercentage: .75,
    name: "Flutter ile Uygulama Geliştirme",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    tamamlanan: "Ders",
    completedPercentage: .60,
    name: "İngilizce Eğitimi",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    tamamlanan: "Ders",
    completedPercentage: .35,
    name: "Girişimcilik Eğitimi",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
    tamamlanan: "Ders",
    completedPercentage: .45,
    name: "Google Proje Yönetimi ",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    tamamlanan: "Ders",
    completedPercentage: .90,
    name: "Unity ile Oyun Geliştirme",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    tamamlanan: "Ders",
    completedPercentage: .25,
    name: "Oyun Sanati",
    thumbnail: "assets/icons/node.png",
  ),
];
