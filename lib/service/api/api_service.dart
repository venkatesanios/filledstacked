import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/dealer_definition_model.dart';
 
part 'api_service.g.dart';

@RestApi(
    // parser: Parser.FlutterCompute,
    )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'http://192.168.1.135:3000/api/v1';
    dio.options.headers = {"action" : "getDealerDefinition"};
    dio.interceptors.addAll([PrettyDioLogger(requestBody: true)]);


    return ApiService(dio);
  }

  @POST('/')
  Future<DealerDefinitionResponse> getDealerDefinition(@Body() DealerDefinitionRequest dealerDefinitionRequest);
  
//   @GET('/users?page={pageId}')
//   Future<DealerDefinitionResponse> getDealerDefinition(@Path('pageId') String pageId);
}
