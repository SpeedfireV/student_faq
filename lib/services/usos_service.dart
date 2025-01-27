import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:oauth1/oauth1.dart' as oauth1;

class UsosService {
  static Future<void> authenticateUser() async {
    var platform = oauth1.Platform(
      'https://apps.usos.pw.edu.pl/services/oauth/request_token', // Temporary credentials request
      'https://apps.usos.pw.edu.pl/services/oauth/authorize', // Resource owner authorization
      'https://apps.usos.pw.edu.pl/services/oauth/access_token', // Token credentials request
      oauth1.SignatureMethods.hmacSha1, // Signature method
    );

    const String apiKey = 'sxfQz2LmQGPYbGTpsgkM';
    const String apiSecret = 'ss4CHVmtMPy7GXTeptWnShHrVSLJfN8C8sxbW4sH';
    var clientCredentials = oauth1.ClientCredentials(apiKey, apiSecret);

    oauth1.Authorization auth =
        oauth1.Authorization(clientCredentials, platform);

    try {
      // Step 1: Request temporary credentials
      var tempCredentials = await auth.requestTemporaryCredentials('oob');

      // Step 2: Redirect user to authorization page
      debugPrint(
          "Open this URL in your browser to authorize: ${auth.getResourceOwnerAuthorizationURI(tempCredentials.credentials.token)}");

      // TODO: Replace this with a Flutter UI to get the PIN from the user
      stdout.write("Enter the PIN displayed after authorization: ");
      String? verifier = stdin.readLineSync();

      if (verifier == null || verifier.isEmpty) {
        throw Exception("No PIN provided!");
      }

      // Step 3: Request token credentials
      var tokenCredentials = await auth.requestTokenCredentials(
        tempCredentials.credentials,
        verifier,
      );

      // Step 4: Use the token credentials to create an authenticated client
      var client = oauth1.Client(
        platform.signatureMethod,
        clientCredentials,
        tokenCredentials.credentials,
      );

      debugPrint(
          "Successfully authenticated! Token: ${tokenCredentials.credentials.token}");
    } catch (e) {
      debugPrint("Error during authentication: $e");
    }
  }
}
