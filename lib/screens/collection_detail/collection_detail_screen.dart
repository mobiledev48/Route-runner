import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/asset_res.dart';
import '../../utils/color_res.dart';
import '../../utils/strings.dart';
import '../../utils/text_style.dart';
import 'collection_detail_controller.dart';

class CollectionDetailScreen extends StatelessWidget {
  CollectionDetailScreen({super.key});
  CollectionDetailController controller = Get.put(CollectionDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Get.height * 0.13,
            width: Get.width,
            color: ColorRes.mainColor,
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorRes.white,
                      size: 20,
                    )),
                SizedBox(width: 20),
                Text(
                  StringRes.collectionDetail,
                  style: appbarStyle().copyWith(fontSize: 20),
                ),
                SizedBox(width: 20),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AssetRes.print,
                      scale: 3,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  AssetRes.photo,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: Get.height * 0.23,
                  width: Get.width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            StringRes.machine,
                            style: commonTitle().copyWith(color: ColorRes.black, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                          ),
                          Text(
                            'Date: 15 Dec, 2023',
                            style: commonSubtitle().copyWith(fontSize: 8),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            'Time: 11:45 PM',
                            style: commonSubtitle().copyWith(fontSize: 8),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('#1-876364'),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Text(StringRes.current),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Text(StringRes.previous),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Text(StringRes.total),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text('data'),
                                SizedBox(
                                  width: Get.width * 0.22,
                                ),
                                Text(StringRes.num4),
                                SizedBox(
                                  width: Get.width * 0.12,
                                ),
                                Text(StringRes.num5),
                                SizedBox(
                                  width: Get.width * 0.14,
                                ),
                                Text(StringRes.num6),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 235),
                        child: Row(
                          children: [
                            Text(
                              'Profit: ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$1000',
                              style: TextStyle(color: ColorRes.green),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            height: Get.height * 0.07,
            width: Get.width * 0.9,
            decoration: BoxDecoration(color: ColorRes.mainColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              StringRes.save,
              style: TextStyle(fontSize: 16, color: ColorRes.white),
            ))),
      ),
    );
  }
}
