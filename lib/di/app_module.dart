import 'package:coin_cap/helper/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:coin_cap/helper/constants.dart';
import 'package:dartin/dartin.dart';
import 'package:coin_cap/model/transaction_repository.dart';
import 'package:coin_cap/viewmodel/home_provider.dart';

SpUtil spUtil;

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers.update("X-CMC_PRO_API_KEY", (_) => CMC_PRO_API_KEY, ifAbsent: () => CMC_PRO_API_KEY);
    options.headers.update("Accept", (_) => "application/json", ifAbsent: () => "application/json");
    return super.onRequest(options);
  }
}
final viewModelModule = Module([
  factory<HomeProvide>(({params}) => HomeProvide(params.get(0), get())),
]);

final remoteModule = Module([
  single<TransactionService>(TransactionService()),
]);

final repoModule = Module([
  lazy<TransactionRepo>(({params}) => TransactionRepo(get())),
]);

final localModule = Module([
  single<SpUtil>(spUtil),
]);

final appModule = [viewModelModule, repoModule, remoteModule, localModule];

final dio = Dio()
  ..options = BaseOptions(baseUrl: 'https://pro-api.coinmarketcap.com/v1/', connectTimeout: 30, receiveTimeout: 30)
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

init() async {
  spUtil = await SpUtil.getInstance();
  // DartIn start
  startDartIn(appModule);
}
