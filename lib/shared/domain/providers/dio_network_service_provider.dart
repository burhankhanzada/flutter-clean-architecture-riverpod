import 'package:dio/dio.dart';
import 'package:flutter_project/shared/data/remote/dio_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final dio = Dio();
    return DioNetworkService(dio);
  },
);
