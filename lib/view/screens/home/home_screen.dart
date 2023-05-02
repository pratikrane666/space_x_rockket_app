import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:space_x_rockket_app/controller/home_controller.dart';
import 'package:space_x_rockket_app/data/model/response/rocket_model.dart';
import 'package:space_x_rockket_app/util/dimensions.dart';
import 'package:space_x_rockket_app/util/theme_colors.dart';
import 'package:space_x_rockket_app/view/base/custom_image.dart';
import '../../../helper/route_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().getRocketList(false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          centerTitle: true,
          title: const Text(
            "SpaceX Rockets",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: ThemeColors.blackColor,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: GetBuilder<HomeController>(builder: (rocketController) {
          List<dynamic> _rocketList = rocketController.rocketList;
          _isLoading = rocketController.isLoading;
          return _rocketList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 15, left: 10, right: 10),
                          itemCount: _rocketList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                RocketModel rocketData =
                                    RocketModel.fromJson(_rocketList[index]);
                                print(rocketData.height);
                                Get.toNamed(RouteHelper.getDetailRoute(
                                  rocketData,
                                ));
                              },
                              child: Container(
                                height: 100,
                                width: 250,
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Column(
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.RADIUS_SMALL),
                                              child: CustomImage(
                                                image: _rocketList[index]
                                                    ["flickr_images"][0],
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ]),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Text('Name: ',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: ThemeColors
                                                                    .greyTextColor)),
                                                        Flexible(
                                                          child: Text(
                                                            _rocketList[index]
                                                                    ["name"]
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  'Montserrat',
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: Dimensions
                                                            .PADDING_SIZE_EXTRA_SMALL),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            'Engines Count: ',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: ThemeColors
                                                                    .greyTextColor)),
                                                        Text(
                                                          _rocketList[index][
                                                                      "engines"]
                                                                  ["number"]
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Montserrat',
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: Dimensions
                                                            .PADDING_SIZE_EXTRA_SMALL),
                                                    Row(
                                                      children: [
                                                        const Text('Country: ',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: ThemeColors
                                                                    .greyTextColor)),
                                                        Flexible(
                                                          child: Text(
                                                            _rocketList[index]
                                                                    ["country"]
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  'Montserrat',
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ]),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Expanded(
                                        child: Divider(thickness: 1)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
        }));
  }
}
