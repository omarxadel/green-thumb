import 'package:flutter/material.dart';
import 'package:greenthumb/src/prediction/prediction_controller.dart';
import 'package:greenthumb/src/prediction/prediction_model.dart';
import 'package:greenthumb/src/ui/outlined_loading_button.dart';

class PredictionView extends StatefulWidget {
  // In the constructor, require a Prediction.
  const PredictionView({super.key, required this.prediction});

  // Declare a field that holds the Prediction.
  final Prediction prediction;

  @override
  State<PredictionView> createState() => _PredictionViewState();
}

class _PredictionViewState extends State<PredictionView> {
  String? treatment;

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
                    Text(widget.prediction.plant,
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
                        Text(widget.prediction.disease,
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
                        Text("${widget.prediction.confidence * 100}%",
                            style: Theme.of(context).textTheme.titleLarge!),
                      ])),
              Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OutlinedLoadingButton(
                          onPressed: () async {
                            var res = await getTreatment(
                                widget.prediction.plant,
                                widget.prediction.disease);

                            setState(() {
                              treatment = res.treatment;
                            });
                          },
                          child: const Text("Explore treatments"),
                        )
                      ])),
              if (treatment != null)
                Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Suggested Treatment:",
                              style: Theme.of(context).textTheme.bodySmall!),
                          Text(treatment!,
                              style: Theme.of(context).textTheme.titleLarge!),
                        ])),
            ],
          )),
    );
  }
}
