import 'package:dio/dio.dart';
import 'package:movie_flix_app/app/networking/api_interceptor.dart';
import 'package:movie_flix_app/app/networking/apis.dart';
import 'package:movie_flix_app/app/networking/response_model/now_playing/now_playing_response.dart';

import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie")
abstract class ApiClient {
  factory ApiClient() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000));

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _ApiClient(dio);
  }

  @GET(Apis.nowPlaying)
  Future<NowPlayingResponse> getNowPlaying(@Query("api_key") String apiKey);


  @GET(Apis.topRated)
  Future<NowPlayingResponse> getTopRated(@Query("api_key") String key);
}
