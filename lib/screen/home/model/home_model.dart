class HomeModel {
  String? name, image, details, image1, distanceEarth, distanceSun;
  double gravity;
  dynamic distance;

  HomeModel(
      {required this.name,
      required this.image,
      required this.details,
      required this.image1,
      required this.gravity,
      required this.distance,
      required this.distanceEarth,
      required this.distanceSun});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
        name: m1['name'],
        image: m1['image'],
        details: m1['details'],
        distance: m1['distance'],
        image1: m1['image1'],
        gravity: m1['gravity'],
        distanceEarth: m1['distance_earth'],
        distanceSun: m1['distance_sun']);
  }
}
