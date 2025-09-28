import 'package:dio/dio.dart';
import 'package:food_delivery_app/features/home/data/models/popular_model/result.dart';

class PeopleService {
  final Dio dio;

  static const String _apiUrl =
      'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b';

  PeopleService({required this.dio});

  Future<List<PersonModel>> fetchPopularPeople() async {
    try {
      final response = await dio.get(_apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> results =
            response.data['results'];

        return results
            .map(
              (json) => PersonModel.fromJson(
                json as Map<String, dynamic>,
              ),
            )
            .toList();
      } else {
        throw Exception(
          'Failed to load popular people. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception(
        'Network error or failed request: ${e.message}',
      );
    }
  }
}
