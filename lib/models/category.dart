class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Yazilim Eğitim',
    noOfCourses: 55,
    thumbnail: 'assets/icons/laptop.jpg',
  ),
  Category(
    name: 'Girişimcilik ',
    noOfCourses: 20,
    thumbnail: 'assets/icons/accounting.jpg',
  ),
  Category(
    name: 'İngilizce ',
    noOfCourses: 16,
    thumbnail: 'assets/icons/photography.jpg',
  ),
  Category(
    name: 'Akademi Takvim',
    noOfCourses: 10,
    thumbnail: 'assets/icons/design.jpg',
  ),
];
