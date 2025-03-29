import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/models/student_info/student_info.dart';
import 'package:url_launcher/url_launcher.dart';

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
  static oauth1.ClientCredentials clientCredentials =
      oauth1.ClientCredentials(apiKey, apiSecret);
  oauth1.Authorization auth = oauth1.Authorization(clientCredentials, platform);

  Future<void> obtainPIN() async {
    try {
      temporaryCredentials = await auth.requestTemporaryCredentials('oob');
      String authorizationUrl = auth.getResourceOwnerAuthorizationURI(
          temporaryCredentials.credentials.token);
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
      final response = await client
          .get(Uri.parse("https://apps.usos.pw.edu.pl/services/users/user"));

      if (response.statusCode == 200) {
        debugPrint(response.body);
        studentInfo = StudentInfo.fromJson(json.decode(response.body));
        return studentInfo;
      } else {
        debugPrint("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

  Future<Iterable<Group>?> getProgrammes() async {
    try {
      final response = await client.get(Uri.parse(
          "https://apps.usos.pw.edu.pl/services/tt/user?start=2024-10-1&fields=course_id|lecturer_ids|classtype_name|type|name|start_time|end_time"));

      if (response.statusCode == 200) {
        List<dynamic> activities = json.decode(response.body);
        final classgroups = activities
            .where((activity) =>
                activity['type'] == 'classgroup' ||
                activity['type'] == 'classgroup2')
            .toList();
        List<List<String>> lecturers = [];
        for (dynamic classgroup in classgroups) {
          List<String> classgroupLecturers = [];
          for (int lecturerId in classgroup["lecturer_ids"]) {
            final response = await client.get(Uri.parse(
                "https://apps.usos.pw.edu.pl/services/users/user?user_id=${lecturerId}"));
            if (response.statusCode == 200) {
              classgroupLecturers.add(json.decode(response.body)["first_name"] +
                  " " +
                  json.decode(response.body)["last_name"]);
            }
          }
          lecturers.add([...classgroupLecturers]);
        }
        return classgroups.asMap().entries.map((entry) {
          return (Group.fromJson(entry.value as Map<String, dynamic>))
              .copyWith(lecturers: lecturers.elementAt(entry.key));
        });
      } else {
        throw "Error: ${response.statusCode}, ${response.body}";
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }
}
