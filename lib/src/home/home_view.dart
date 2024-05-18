import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:greenthumb/src/prediction/prediction_controller.dart';
import 'package:greenthumb/src/prediction/prediction_view.dart';
import 'package:greenthumb/src/ui/outlined_loading_button.dart';

import '../settings/settings_view.dart';

/// Displays the homepage.
class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedFile = "";
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    void selectFile() async {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          selectedFile = result.files.first.name;
        });

        image = result.files.first.bytes;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text("Find out what's wrong with your plant🌿",
                      style: Theme.of(context).textTheme.headlineSmall!)),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Upload an image of your sick plant and let us help you figure out what's wrong.",
                    style: Theme.of(context).textTheme.bodyMedium!,
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: OutlinedLoadingButton(
                      onPressed: () {
                        selectFile();
                      },
                      child: const Text(
                        "Upload Image",
                      ))),
              if (image != null)
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.memory(
                        image!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Text(selectedFile),
                      OutlinedLoadingButton(
                          onPressed: () async {
                            try {
                              var res = await createPrediction(image!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PredictionView(prediction: res),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text(
                            "Continue with image",
                          )),
                    ],
                  ),
                ),
            ]));
  }
}
