import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:space_x_rockket_app/data/model/response/rocket_model.dart';
import 'package:space_x_rockket_app/view/base/image_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/theme_colors.dart';

class DetailScreen extends StatefulWidget {
  RocketModel rocketDetail;
  DetailScreen({Key? key, required this.rocketDetail}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.rocketDetail);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _launchURL(url) async {
    // const url = url;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  const Icon(Icons.arrow_back, color: ThemeColors.blackColor)),
          title: const Text(
            "Rocket Detail",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: ThemeColors.blackColor,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.rocketDetail.name.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              ///Flicker Images
              ImageView(imageList: widget.rocketDetail.flickrImages!.toList()),

              ///Active Status
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  children: [
                    const Text('Active Status:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        widget.rocketDetail.active.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              ///Cost Per Launch
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  children: [
                    const Text('Cost Per Launch:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        "\u{20B9}" +
                            widget.rocketDetail.costPerLaunch.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              ///Success Rate Percent
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  children: [
                    const Text('Success Rate:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        widget.rocketDetail.successRatePct.toString() + '%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              ///Description
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(
                        widget.rocketDetail.description.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              ///Wikipedia Link
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Wikipedia Link:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          _launchURL(widget.rocketDetail.wikipedia.toString());
                        },
                        child: Text(
                          widget.rocketDetail.wikipedia.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              ///Height
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  children: [
                    const Text('Height:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        widget.rocketDetail.height!.feet.toString() + "ft",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              ///Diameter
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  children: [
                    const Text('Diameter:',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        widget.rocketDetail.diameter!.feet.toString() + "ft",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
