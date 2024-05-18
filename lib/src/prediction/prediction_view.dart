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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Plant Name:",
                        style: Theme.of(context).textTheme.bodySmall!),
                    Text(prediction.plant,
                        style: Theme.of(context).textTheme.titleLarge!),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Disease:",
                            style: Theme.of(context).textTheme.bodySmall!),
                        Text(prediction.disease,
                            style: Theme.of(context).textTheme.titleLarge!),
                      ])),
              Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Confidence:",
                            style: Theme.of(context).textTheme.bodySmall!),
                        Text("${prediction.confidence * 100}%",
                            style: Theme.of(context).textTheme.titleLarge!),
                      ]))
            ],
          )),
    );
  }
}
