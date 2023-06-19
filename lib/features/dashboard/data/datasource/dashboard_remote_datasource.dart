import 'package:dartz/dartz.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/paginated_response.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';

abstract class DashboardDatasource {
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
    int skip,
  );

  Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts({
    required int skip,
    required String query,
  });
}

class DashboardRemoteDatasource extends DashboardDatasource {
  final NetworkService networkService;
  DashboardRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchPaginatedProducts(
    int skip,
  ) async {
    final response = await networkService.get(
      '/products',
      queryParameters: {
        'skip': skip,
        'limit': PRODUCTS_PER_PAGE,
      },
    );

    return response.fold(
      Left.new,
      (r) {
        final Map<String, dynamic> jsonData = r.data;
        if (jsonData.isEmpty) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse = PaginatedResponse.fromJson(
          jsonData,
          jsonData['products'] ?? [],
        );
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts({
    required int skip,
    required String query,
  }) async {
    final response = await networkService.get(
      '/products/search?q=$query',
      queryParameters: {
        'skip': skip,
        'limit': PRODUCTS_PER_PAGE,
      },
    );

    return response.fold(
      Left.new,
      (r) {
        final Map<String, dynamic> jsonData = r.data;
        if (jsonData.isEmpty) {
          return Left(
            AppException(
              identifier: 'search PaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final paginatedResponse = PaginatedResponse<Product>.fromJson(
          jsonData,
          jsonData['products'] ?? [],
        );
        return Right(paginatedResponse);
      },
    );
  }
}
