import 'dart:convert';
import 'package:delaware_makes/apis/googleclient/gmanager/gdocs.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gsheets.dart';
import 'package:googleapis/drive/v2.dart' as drive;
import 'package:googleapis/docs/v1.dart' as docs;
import 'package:googleapis/sheets/v4.dart' as v4;
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'gsheets_util.dart';
import '../client.dart' as commons;
import '../requests.dart' as req;

//final scopes = [drive.DriveApi.DriveScope, docs.DocsApi.DocumentsScope ];
const _sheetsEndpoint = 'https://sheets.googleapis.com/v4/spreadsheets/';
//const _filesEndpoint = 'https://www.googleapis.com/drive/v2/files/';

/// [Exception] that throws gsheets.

/// Manages googleapis auth and [Spreadsheet] fetching.
class GManager {
  Future<AutoRefreshingAuthClient> _client;
  final ServiceAccountCredentials _credentials;
  final List<String> _scopes;

  /// Creates an instance of [GSheets].
  /// [credentialsJson] - must be provided, it can be either a [Map] or a
  /// JSON map encoded as a [String].
  /// [impersonatedUser] - optional, used to set the user to impersonate
  /// [scopes] - optional (defaults to `[SpreadsheetsScope, DriveScope]`).
  GManager(
    credentialsJson, {
    String impersonatedUser,
    List<String> scopes = const [
      v4.SheetsApi.SpreadsheetsScope,
      drive.DriveApi.DriveScope,
      docs.DocsApi.DocumentsScope
    ],
  })  : _scopes = scopes,
        _credentials = ServiceAccountCredentials.fromJson(
          credentialsJson,
          impersonatedUser: impersonatedUser,
        ) {
    client;
  }

  /// Returns Future [AutoRefreshingAuthClient] - autorefreshing,
  /// authenticated HTTP client.
  Future<AutoRefreshingAuthClient> get client {
    _client ??= clientViaServiceAccount(_credentials, _scopes);
    return _client;
  }

  Future<GoogleDocInfo> getDocData({String docTitle, String documentId}) async {
    var _url;
    var _body;
   // print("GET DOC DATA");
    http.Client cl = await client;
    commons.ApiRequester _requester = commons.ApiRequester(
        cl, "https://docs.googleapis.com/", "", 'dart-api-client docs/v1');
    if (documentId == null) {
      throw new ArgumentError("Parameter documentId is required.");
    }

    var _queryParams = new Map<String, List<String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = req.DownloadOptions.Metadata;
    _url = 'v1/documents/' + commons.Escaper.ecapeVariable('$documentId');
    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
        // TODO Figure Out What I want the Document Model to include and how 
        //I want to connect it to content
    return _response.then((docData) {
     // List<String> txt = parseDataList(data: docData);
     Map<String, dynamic> txt = parseDataList(data: docData);
    //  print(txt);
      GoogleDocInfo g = GoogleDocInfo(
          docID: documentId, title: docTitle, text: txt[0]);
      g.sections= txt;
      return g;
    });
    //return await getData(
    //   client: await client, docTitle: docTitle, documentId: documentId);
  }

  /// Fetches and returns Future [Spreadsheet].
  /// Requires SheetsApi.SpreadsheetsScope.
  /// [render] - determines how values should be rendered in the output. https://developers.google.com/sheets/api/reference/rest/v4/ValueRenderOption
  /// [input] - determines how input data should be interpreted. https://developers.google.com/sheets/api/reference/rest/v4/ValueInputOption
  /// Throws Exception if [GSheets]'s scopes does not include SpreadsheetsScope.
  /// Throws GSheetsException if does not have permission.
  Future<Spreadsheet> spreadsheet(
    String spreadsheetId, {
    ValueRenderOption render = ValueRenderOption.unformatted_value,
    ValueInputOption input = ValueInputOption.user_entered,
  }) async {
    final client = await this.client.catchError((_) {
      // retry once on error
      _client = null;
      return this.client;
    });
    final response = await client.get('$_sheetsEndpoint$spreadsheetId');
    checkResponse(response);
    final renderOption = _parseRenderOption(render);
    final inputOption = _parseInputOption(input);
    final sheets = (jsonDecode(response.body)['sheets'] as List)
        .map((json) => Worksheet.fromJson(
              json,
              client,
              spreadsheetId,
              renderOption,
              inputOption,
            ))
        .toList();
    return Spreadsheet(
      client,
      spreadsheetId,
      sheets,
      renderOption,
      inputOption,
    );
  }

  static String _parseRenderOption(ValueRenderOption option) {
    switch (option) {
      case ValueRenderOption.formatted_value:
        return 'FORMATTED_VALUE';
      case ValueRenderOption.formula:
        return 'FORMULA';
      default:
        return 'UNFORMATTED_VALUE';
    }
  }
  static String _parseInputOption(ValueInputOption option) {
    switch (option) {
      case ValueInputOption.user_entered:
        return 'USER_ENTERED';
      default:
        return 'RAW';
    }
  }

  static Future<http.Response> batchUpdate(
    AutoRefreshingAuthClient client,
    String spreadsheetId,
    List<Map<String, dynamic>> requests,
  ) async {
    final response = await client.post(
      '$_sheetsEndpoint$spreadsheetId:batchUpdate',
      body: jsonEncode({'requests': requests}),
    );
    checkResponse(response);
    return response;
  }
}
