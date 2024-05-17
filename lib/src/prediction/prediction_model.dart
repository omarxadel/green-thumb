class Prediction {
  final bool success;
  final String message;

  const Prediction({required this.success, required this.message});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}
