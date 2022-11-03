import 'package:dio/dio.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/model/order_details/OrderDetails.dart';
import 'package:flutter_pixel_project/network/interceptor/oauth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'server_api.g.dart';

@RestApi(baseUrl: "https://gad24.tools/api")
abstract class RestClient {
  factory RestClient({required String baseUrl}) {
    Dio dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(OauthInterceptor());

    dio.options = BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET("/v2/orders/list?sort[submitTime]=1")
  Future<OrdersResponse> getOrders(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("statuses[0]") String status,
  );

  @GET("/v2/orders/list?statuses[0]=DOWNLOADED&statuses[1]=ARCHIVED&statuses[2]=READY&statuses[3]=DELIVERED")
  Future<OrdersResponse> getOrdersArchive(
      @Query("page") int page,
      @Query("limit") int limit,
      );

  @PUT("/v2/orders/{id}/qa")
  Future<OrderDetails> getOrderDetails(@Path('id') String id);
}