import 'package:flutter_project/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_project/features/authentication/data/repositories/atuhentication_repository_impl.dart';
import 'package:flutter_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authdataSourceProvider =
    Provider.family<LoginUserDataSource, NetworkService>(
  (_, networkService) => LoginUserRemoteDataSource(networkService),
);

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final networkService = ref.watch(netwokServiceProvider);
    final dataSource = ref.watch(authdataSourceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
