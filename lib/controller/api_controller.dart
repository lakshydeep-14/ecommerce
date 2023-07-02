// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:softbenz_infosys/configs/extensions.dart';
import 'package:softbenz_infosys/models/models.dart';
import 'package:softbenz_infosys/models/custom_variants.dart';

enum ResponseState { initial, loading, loaded, error }

class SelectedVariants {
  String? color, ram, rom;
  SelectedVariants({this.rom, this.ram, this.color});
}

class ApiController extends GetxController {
  Rx<ResponseState> resState = ResponseState.initial.obs;
  RxString errorMessage = ''.obs;
  RxString selectedrams = ''.obs;
  RxString selectedroms = ''.obs;
  RxString selectedcolor = ''.obs;
  Rx<Data> data = Data().obs;
  Rx<SelectedVariants> selectedVariants = SelectedVariants().obs;
  Rx<CustomVariants> result = CustomVariants().obs;

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

  List<CustomVariants> getVariants() {
    List<CustomVariants> cv = [];
    for (var el in data.value.variantDetails!) {
      cv.add(CustomVariants(
          variantDetail: el,
          color: el.variants!
              .where((e) => e.typeData!.name == 'Colors')
              .first
              .valueData!
              .name!,
          ram: el.variants!
              .where((e) => e.typeData!.name == 'RAM')
              .first
              .valueData!
              .name!,
          rom: el.variants!
              .where((e) => e.typeData!.name == 'ROM')
              .first
              .valueData!
              .name!));
    }

    return cv;
  }

  List<String> getColorVariants() {
    List<String> colors = [];
    for (var element in data.value.variantDetails!) {
      var a =
          element.variants!.where((e) => e.typeData!.name == 'Colors').toList();
      for (var element in a) {
        colors.add(element.valueData!.name!);
      }
    }

    var res = colors.toSet().toList();

    return res;
  }

  List<String> getRAMvariants() {
    List<String> rams = [];
    for (var element in data.value.variantDetails!) {
      var a =
          element.variants!.where((e) => e.typeData!.name == 'RAM').toList();
      for (var element in a) {
        rams.add(element.valueData!.name!);
      }
    }
    var res = rams.toSet().toList();

    return res;
  }

  List<String> getROMvariants() {
    List<String> roms = [];
    for (var element in data.value.variantDetails!) {
      var a =
          element.variants!.where((e) => e.typeData!.name == 'ROM').toList();
      for (var element in a) {
        roms.add(element.valueData!.name!);
      }
    }

    var res = roms.toSet().toList();

    return res;
  }

  getFinalProduct() {
    var res = getVariants()
        .where((e) =>
            e.ram == selectedVariants.value.ram &&
            e.rom == selectedVariants.value.rom &&
            e.color == selectedVariants.value.color)
        .first;
    result.value = res;
  }

  SelectedVariants getSel() {
    return selectedVariants.value;
  }
}
