class Prediction {
  final bool success;
  final String plant;
  final String disease;

  const Prediction(
      {required this.success, required this.plant, required this.disease});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      success: json['success'] as bool,
      plant: json['plant'] as String,
      disease: json['disease'] as String,
    );
  }
}
