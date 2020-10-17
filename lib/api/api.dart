import 'package:mime/mime.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<String> fetchResponse(File imageFile) async {
  final mimeTypeData =
      lookupMimeType(imageFile.path, headerBytes: [0xFF, 0xD8]).split('/');

  final imageUploadRequest = http.MultipartRequest(
    'POST',
    Uri.parse('http://192.168.0.104:5000/generate'),
  );

  final file = await http.MultipartFile.fromPath(
    'image',
    imageFile.path,
    contentType: MediaType(
      mimeTypeData[0],
      mimeTypeData[1],
    ),
  );

  imageUploadRequest.fields['ext'] = mimeTypeData[1];
  imageUploadRequest.files.add(file);

  try {
    final streamedResponse = await imageUploadRequest.send();

    final response = await http.Response.fromStream(streamedResponse);

    final Map<String, dynamic> responseData = json.decode(response.body);

    String outputImage = responseData['result'];

    String imageUrl = 'http://192.168.0.104:5000/download/' + outputImage;

    return imageUrl;
  } catch (error) {
    return null;
  }
}
