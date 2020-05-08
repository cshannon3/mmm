///
/// [cause] - exception message.
///
/// GSheetsException is thrown:
/// - in case of invalid arguments;
/// - in case of google api returning an error.
// class GSheetsException implements Exception {
//   final String cause;

//   GSheetsException(this.cause);

//   @override
//   String toString() => 'GSheetsException: $cause';
// }

// /// [Exception] that throws gsheets.
// ///
// /// [cause] - exception message.
// ///
// /// GSheetsException is thrown:
// /// - in case of invalid arguments;
// /// - in case of google api returning an error.
// class GSheetsException implements Exception {
//   final String cause;

//   GSheetsException(this.cause);

//   @override
//   String toString() => 'GSheetsException: $cause';
// }

// /// Manages googleapis auth and [Spreadsheet] fetching.
// class GManager {
//   Future<AutoRefreshingAuthClient> _client;
//   final ServiceAccountCredentials _credentials;
//   final List<String> _scopes;

//   /// Creates an instance of [GSheets].
//   ///
//   /// [credentialsJson] - must be provided, it can be either a [Map] or a
//   /// JSON map encoded as a [String].
//   ///
//   /// [impersonatedUser] - optional, used to set the user to impersonate
//   ///
//   /// [scopes] - optional (defaults to `[SpreadsheetsScope, DriveScope]`).
//   GManager(
//     credentialsJson, {
//     String impersonatedUser,
//     List<String> scopes = const [
//       v4.SheetsApi.SpreadsheetsScope,
//       drive.DriveApi.DriveScope, docs.DocsApi.DocumentsScope
//       //  v4.SheetsApi.DriveScope,
//     ],
//   })  : _scopes = scopes,
//         _credentials = ServiceAccountCredentials.fromJson(
//           credentialsJson,
//           impersonatedUser: impersonatedUser,
//         ) {
//     // pre-initializes client
//     client;
//   }

//   /// Returns Future [AutoRefreshingAuthClient] - autorefreshing,
//   /// authenticated HTTP client.
//   Future<AutoRefreshingAuthClient> get client {
//     _client ??= clientViaServiceAccount(_credentials, _scopes);
//     return _client;
//   }

//   Future<GoogleDocInfo> getDocData({String docTitle, String documentId}) async {
//     return await getData(
//         client: await client, docTitle: docTitle, documentId: documentId);
//   }

//   /// Fetches and returns Future [Spreadsheet].
//   ///
//   /// Requires SheetsApi.SpreadsheetsScope.
//   ///
//   /// [render] - determines how values should be rendered in the output.
//   /// https://developers.google.com/sheets/api/reference/rest/v4/ValueRenderOption
//   ///
//   /// [input] - determines how input data should be interpreted.
//   /// https://developers.google.com/sheets/api/reference/rest/v4/ValueInputOption
//   ///
//   /// Throws Exception if [GSheets]'s scopes does not include SpreadsheetsScope.
//   /// Throws GSheetsException if does not have permission.
//   Future<Spreadsheet> spreadsheet(
//     String spreadsheetId, {
//     ValueRenderOption render = ValueRenderOption.unformatted_value,
//     ValueInputOption input = ValueInputOption.user_entered,
//   }) async {
//     final client = await this.client.catchError((_) {
//       // retry once on error
//       _client = null;
//       return this.client;
//     });
//     final response = await client.get('$_sheetsEndpoint$spreadsheetId');
//     checkResponse(response);
//     final renderOption = _parseRenderOption(render);
//     final inputOption = _parseInputOption(input);
//     final sheets = (jsonDecode(response.body)['sheets'] as List)
//         .map((json) => Worksheet._fromJson(
//               json,
//               client,
//               spreadsheetId,
//               renderOption,
//               inputOption,
//             ))
//         .toList();
//     return Spreadsheet._(
//       client,
//       spreadsheetId,
//       sheets,
//       renderOption,
//       inputOption,
//     );
//   }

//   static String _parseRenderOption(ValueRenderOption option) {
//     switch (option) {
//       case ValueRenderOption.formatted_value:
//         return 'FORMATTED_VALUE';
//       case ValueRenderOption.formula:
//         return 'FORMULA';
//       default:
//         return 'UNFORMATTED_VALUE';
//     }
//   }

//   static String _parseInputOption(ValueInputOption option) {
//     switch (option) {
//       case ValueInputOption.user_entered:
//         return 'USER_ENTERED';
//       default:
//         return 'RAW';
//     }
//   }

//   static Future<http.Response> _batchUpdate(
//     AutoRefreshingAuthClient client,
//     String spreadsheetId,
//     List<Map<String, dynamic>> requests,
//   ) async {
//     final response = await client.post(
//       '$_sheetsEndpoint$spreadsheetId:batchUpdate',
//       body: jsonEncode({'requests': requests}),
//     );
//     checkResponse(response);
//     return response;
//   }
// }

