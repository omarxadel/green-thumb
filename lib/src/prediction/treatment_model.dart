class Treatment {
  final String treatment;

  const Treatment({required this.treatment});

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      treatment: json['treatment'] as String,
    );
  }
}
