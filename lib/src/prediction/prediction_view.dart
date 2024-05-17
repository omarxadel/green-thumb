import 'package:flutter/material.dart';
import 'package:greenthumb/src/prediction/prediction_model.dart';

class PredictionView extends StatelessWidget {
  // In the constructor, require a Prediction.
  const PredictionView({super.key, required this.prediction});

  // Declare a field that holds the Prediction.
  final Prediction prediction;

  @override
  Widget build(BuildContext context) {
    // Use the Prediction to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Prediction"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("Plant Name"),
              Text(prediction.plant),
              const Text("Disease"),
              Text(prediction.plant),
            ],
          )),
    );
  }
}
