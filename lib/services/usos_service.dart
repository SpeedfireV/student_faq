import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:student_faq/models/student_info/student_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/programme/programme_model.dart';

class UsosService {
  late oauth1.AuthorizationResponse temporaryCredentials;
  late oauth1.Client client;
  StudentInfo? studentInfo;
  static oauth1.Platform platform = oauth1.Platform(
    'https://apps.usos.pw.edu.pl/services/oauth/request_token?scopes=studies|staff_perspective', // Temporary credentials request
    'https://apps.usos.pw.edu.pl/services/oauth/authorize', // Resource owner authorization
    'https://apps.usos.pw.edu.pl/services/oauth/access_token', // Token credentials request
    oauth1.SignatureMethods.hmacSha1, // Signature method
  );
  static String apiKey = dotenv.env['USOS_API_KEY']!;
  static String apiSecret = dotenv.env["USOS_API_SECRET"]!;
  static oauth1.ClientCredentials clientCredentials = oauth1.ClientCredentials(apiKey, apiSecret);
  oauth1.Authorization auth =
  oauth1.Authorization(clientCredentials, platform);


  Future<void> obtainPIN() async {

    try {
      temporaryCredentials = await auth.requestTemporaryCredentials('oob');
      String authorizationUrl = auth.getResourceOwnerAuthorizationURI(temporaryCredentials.credentials.token);
      // authorizationUrl += "&scopes=cards";
      await launchUrl(Uri.parse(authorizationUrl));
    } catch (e) {
      debugPrint("Error during authentication: $e");
    }
  }
  Future<void> requestCredentialsUsingPin(String PIN) async {
    var tokenCredentials = await auth.requestTokenCredentials(
      temporaryCredentials.credentials,
      PIN,
    );
    client = oauth1.Client(
      platform.signatureMethod,
      clientCredentials,
      tokenCredentials.credentials,
    );
  }

  Future<StudentInfo?> getStudentStatus() async {
    try {
      final response = await client.get(Uri.parse("https://apps.usos.pw.edu.pl/services/users/user"));

      if (response.statusCode == 200) {
        debugPrint(response.body);
        studentInfo =StudentInfo.fromJson( json.decode(response.body));
        getProgrammes();
        return studentInfo;

      } else {
        debugPrint("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }
  Future<Iterable<Programme>?> getProgrammes() async {
    try {
      final response = await client.get(Uri.parse("https://apps.usos.pw.edu.pl/services/tt/user?start=2024-10-1"));

      if (response.statusCode == 200) {
        debugPrint(response.body); // Use debugPrint instead of print

        List<dynamic> jsonData = json.decode(response.body);

        return jsonData.map((studentClass) {
          return Programme.fromJson(studentClass as Map<String, dynamic>); // Explicit casting
        });
      } else {
        throw "Error: ${response.statusCode}, ${response.body}";
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

}
