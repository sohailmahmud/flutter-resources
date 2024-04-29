import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../app/routes/app_pages.dart';
import 'package:uni_links/uni_links.dart';

class UniLinksService {
  static String _propertyId = '';
  static String get propertyId => _propertyId;
  static bool get hasPropertyId => _propertyId.isNotEmpty;

  static void reset() => _propertyId = '';

  StreamSubscription? _sub;

  static Future<void> init({checkActualVersion = false}) async {
    // This is used for cases when: APP is not running and the user clicks on a link.
    try {
      final Uri? uri = await getInitialUri();
      _uniLinkHandler(uri: uri);
    } on PlatformException {
      if (kDebugMode) print("(PlatformException) Failed to receive initial uri.");
    } on FormatException catch (error) {
      if (kDebugMode) print("(FormatException) Malformed Initial URI received. Error: $error");
    }

    // This is used for cases when: APP is already running and the user clicks on a link.
    uriLinkStream.listen((Uri? uri) async {
      _uniLinkHandler(uri: uri);
    }, onError: (error) {
      if (kDebugMode) print('UniLinks onUriLink error: $error');
    });
  }

  static Future<void> _uniLinkHandler({required Uri? uri}) async {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> params = uri.queryParameters;

    if (params.containsKey('id')) {
      _propertyId = params['id']!;
      if (kDebugMode) print('Property ID: $_propertyId');
      Get.toNamed(Routes.PROPERTY_DETAILS, arguments:{'id': _propertyId});
    }
  }
}
