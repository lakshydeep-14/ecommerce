import 'package:dio/dio.dart';
import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/models/models.dart';

enum ResponseState { initial, loading, loaded, error }

class ApiController extends GetxController {
  Rx<ResponseState> resState = ResponseState.initial.obs;
  RxString errorMessage = ''.obs;
  Rx<Data> data = Data().obs;

  getData() async {
    resState.value = ResponseState.loading;
    try {
      var response = await Dio().get(AppConstants.baseUrl);

      final res = mobileModelFromMap(response.toString());

      resState.value = ResponseState.loaded;
      data.value = res.data!;
    } on DioException catch (e) {
      resState.value = ResponseState.error;
      errorMessage.value = e.message.toString();

      throw errorMessage.value;
    } catch (e) {
      throw Exception(e);
    }
  }
}
