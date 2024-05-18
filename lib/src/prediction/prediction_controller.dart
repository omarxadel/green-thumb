import 'dart:convert';
import 'dart:typed_data';
import 'package:greenthumb/src/prediction/treatment_model.dart';
import 'package:http/http.dart' as http;
import 'package:greenthumb/src/prediction/prediction_model.dart';
import 'package:http_parser/http_parser.dart';

const apiURL = "http://localhost:5000/";

Future<Prediction> createPrediction(Uint8List image) async {
  final uri = Uri.parse('${apiURL}predict');

  var request = http.MultipartRequest("POST", uri);

  request.files.add(http.MultipartFile.fromBytes("file", image,
      filename: "Photo.jpg", contentType: MediaType("image", "jpg")));

  final response = await request.send();

  final data = await response.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .first;
  {
    if (data != null) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Prediction.fromJson(data as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create Prediction.');
    }
  }
}

Future<Treatment> getTreatment(String plant, String disease) async {
  final uri = Uri.parse('${apiURL}treatment');
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'plant': plant, 'disease': disease}),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Treatment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Prediction.');
  }
}
