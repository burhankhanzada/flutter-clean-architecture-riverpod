import 'package:flutter_project/shared/data/local/shared_prefs_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) {
  return SharedPrefsService()..init();
});
