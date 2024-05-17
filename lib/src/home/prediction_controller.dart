import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:greenthumb/src/home/prediction_model.dart';

Future<Prediction> createPrediction(String title) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/predict'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Prediction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Prediction.');
  }
}
