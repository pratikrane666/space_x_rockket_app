import 'package:get/get.dart';
import 'package:space_x_rockket_app/data/api/api_checker.dart';
import 'package:space_x_rockket_app/data/repository/home_repo.dart';


class HomeController extends GetxController implements GetxService {
  ItemRepo itemRepo;
  HomeController({required this.itemRepo});

  // Latest products
  List<dynamic>? _rocketList;
  bool _isLoading = false;
  int _imageSliderIndex = 0;

  List<dynamic> get rocketList => _rocketList ?? [];
  bool get isLoading => _isLoading;
  int get imageSliderIndex => _imageSliderIndex;

  Future<void> getRocketList(bool notify) async {
    if (notify) {
      update();
    }
    if (_rocketList == null) {
      Response response = await itemRepo.getRocketList();
      if (response.statusCode == 200) {
        print(response.body);
        _rocketList = [];
        final Iterable refactorRocketList = response.body! ?? [];
        _rocketList!.addAll(refactorRocketList);
        print(_rocketList);
        _isLoading = false;
      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }
  }

  void setImageSliderIndex(int index) {
    _imageSliderIndex = index;
    update();
  }
}
