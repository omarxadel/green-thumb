class Prediction {
  final double confidence;
  final String plant;
  final String disease;

  const Prediction(
      {required this.confidence, required this.plant, required this.disease});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      confidence: json['confidence'] as double,
      plant: json['plant'] as String,
      disease: json['disease'] as String,
    );
  }
}
