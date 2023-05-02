import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x_rockket_app/controller/home_controller.dart';
import 'package:space_x_rockket_app/helper/responsive_helper.dart';
import 'package:space_x_rockket_app/util/dimensions.dart';
import 'package:space_x_rockket_app/view/base/custom_image.dart';

class ImageView extends StatelessWidget {
  List<String> imageList;
  ImageView({Key? key, required this.imageList}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (itemController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Stack(children: [
                SizedBox(
                  height: ResponsiveHelper.isDesktop(context)
                      ? 350
                      : MediaQuery.of(context).size.width * 0.7,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomImage(
                          image: '${imageList[index]}',
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      itemController.setImageSliderIndex(index);
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _indicators(context, itemController, imageList),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _indicators(BuildContext context, HomeController itemController,
      List<String> _imageList) {
    List<Widget> indicators = [];
    for (int index = 0; index < _imageList.length; index++) {
      indicators.add(TabPageSelectorIndicator(
        backgroundColor: index == itemController.imageSliderIndex
            ? Theme.of(context).primaryColor
            : Colors.white,
        borderColor: Colors.white,
        size: 10,
      ));
    }
    return indicators;
  }
}
