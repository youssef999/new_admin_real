import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:realstateAdmin/features/buildings/controller/item_controller.dart';
import 'package:realstateAdmin/features/buildings/widgets/custom_radio.dart';

import '../../../Core/widgets/Custom_Text.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../controller/new_item_controller.dart';

class ItemView extends StatefulWidget {
//GetView<ItemController> {
  const ItemView({Key? key}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  NewItemController controller = Get.put(NewItemController());
  @override
  void initState() {
    try {
      // final box = GetStorage();

      Future.delayed(const Duration(seconds: 1)).then((value) {});
    } catch (e) {
      // Ui.logSuccess(e);
    }
      controller.radioValue = "one";
    controller.selectedListArea.value = controller.firstArea;
    controller.pickedImageXFiles = [];
    controller.pickedImageXFiles2 = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar('addBuild'.tr, context,),
        body: GetBuilder<NewItemController>(builder: (_) {
          return DefaultTabController(
              length: 3,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Obx(() {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 10),
                            child: Text(
                              'whatType'.tr,
                              style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor),
                            ),
                          ),
                          Row(
                            children: [
                              customRadioButton("sell".tr, 1),
                              customRadioButton("rent".tr, 2),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 5),
                            child: Text(
                              'whatBuild'.tr,
                              style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 90, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: TabBar(
                                unselectedLabelColor: AppColors.darkColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor: AppColors.primaryBGLightColor,
                                labelStyle: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                indicatorWeight: 5,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(78, 7, 95, 154)),
                                dividerHeight: 00,
                                tabs: [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("residential".tr),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("investing".tr),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("others".tr),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 150,
                            child: TabBarView(
                              children: [
                                firstTabBar(),
                                // Content for the second tab
                                secoundTabBar(),
                                // Content for the second tab
                                thirdTabBar()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              'whereBuild'.tr,
                              style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor),
                            ),
                          ),

                          dropDown(
                              'country'.tr, controller.selectedCountry.value,
                              (String? newValue) {
                            if (newValue != null) {
                              controller.changeFilterCountry(newValue);
                              controller.build.value.locationCountry = newValue;
                            } else {
                              controller.build.value.locationCountry =
                                  'العاصمه';
                            }
                          }, controller.countryNames),
                          //    dropDown('اختر المدينه'),

                          dropDown('area'.tr, controller.selectedArea.value,
                              (String? newValuex) {
                            if (newValuex != null) {
                              controller.changeFilterArea(newValuex);
                              controller.build.value.locationArea = newValuex;
                            } else {
                              controller.build.value.locationArea =
                                  "مدينة جابر الأحمد";
                            }
                          }, controller.selectedListArea),
                          const SizedBox(
                            height: 15,
                          ),
                          txtForm(formKey, 'propertyAddress'.tr, 2, (v) {
                            controller.build.value.name = v;
                          }, TextInputType.text, true),

                          txtForm(formKey, 'addressDetail'.tr, 3, (v) {
                            controller.build.value.address = v;
                          }, TextInputType.text, true),
                          txtForm(formKey, 'buildNumber'.tr, 0, (v) {
                            controller.build.value.buildNum = v;
                          }, const TextInputType.numberWithOptions(), true),
                          txtForm(formKey, 'toiletNumber'.tr, 0, (v) {
                            controller.build.value.toilet = v;
                          }, const TextInputType.numberWithOptions(), false),
                          txtForm(formKey, 'bedNumber'.tr, 0, (v) {
                            controller.build.value.rooms = v;
                          }, const TextInputType.numberWithOptions(), false),
                          txtForm(formKey, 'steps'.tr, 0, (v) {
                            controller.build.value.buildingSteps = v;
                          }, const TextInputType.numberWithOptions(), false),
                          txtForm(formKey, 'space'.tr, 0, (v) {
                            controller.build.value.space = v;
                          }, const TextInputType.numberWithOptions(), false),
                          txtForm(formKey, 'monthRent'.tr, 0, (v) {
                            controller.build.value.rentMonthly = v;
                          }, const TextInputType.numberWithOptions(), false),
                          txtForm(formKey, 'insureAmount'.tr, 0, (v) {
                            controller.build.value.bankSafe = v;
                          }, const TextInputType.numberWithOptions(), true),
                          txtForm(formKey, 'rentTime'.tr, 0, (v) {
                            controller.build.value.rentTime = v;
                          }, const TextInputType.numberWithOptions(), true),

                          txtForm(formKey, 'gracePeriod'.tr, 0, (v) {
                            controller.build.value.lettingTime = v;
                          }, const TextInputType.numberWithOptions(), true),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 10),
                            child: Text(
                              'addMedia'.tr,
                              style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor),
                            ),
                          ),
////////////////////////////////////////////////////////////////////
                          GetBuilder<NewItemController>(builder: (_) {
                            return Container(
                                height: 280,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Custom_Text(
                                      text: 'loadMedia'.tr,
                                      color: Colors.black,
                                      fontSize: 32,
                                      alignment: Alignment.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    (controller.pickedImageXFiles != null &&
                                            controller
                                                .pickedImageXFiles!.isNotEmpty)
                                        ? SizedBox(
                                            width: double.infinity,
                                            height: 200,
                                            child: ListView(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  for (int i = 0;
                                                      i <
                                                          controller
                                                              .pickedImageXFiles!
                                                              .length;
                                                      i++)
                                                    InkWell(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 10,
                                                            right: 10),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        width: 220,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    File(controller
                                                                        .pickedImageXFiles![
                                                                            i]
                                                                        .path)),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                      onTap: () {
                                                        controller
                                                            .pickMultiImage();
                                                      },
                                                    ),
                                                ]),
                                          )
                                        : DottedBorder(
                                            color:
                                                AppColors.primaryBGLightColor,
                                            radius: const Radius.circular(25),
                                            borderType: BorderType.RRect,
                                            dashPattern: const [5, 6],
                                            child: GestureDetector(
                                                onTap: () {
                                                  controller.pickMultiImage();
                                                },
                                                child: Container(
                                                  width: 350,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              236,
                                                              236,
                                                              236),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.flip_camera_ios,
                                                        color: Colors.red,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text('loadMedia'.tr,
                                                          style:
                                                              GoogleFonts.cairo(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ],
                                                  ),
                                                ))),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ));
                          }),
////////////////////////////////////////////////////////////////////
                          (controller.isLoading == false)
                              ? InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 31),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text('addBuild'.tr,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cairo(
                                            fontSize: 30,
                                            color: AppColors.mainly)),
                                  ),
                                  onTap: () {
                                    List<String> images = [];
                                    if (controller
                                        .pickedImageXFiles!.isNotEmpty) {
                                      for (int i = 0;
                                          i <
                                              controller
                                                  .pickedImageXFiles!.length;
                                          i++) {
                                        images.add(controller
                                            .pickedImageXFiles![i].path);
                                      }
                                    }

                                    if (formKey.currentState!.validate() ==
                                        false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('يرجى تعبئة البيانات'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else if (controller
                                        .pickedImageXFiles!.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('يرحي ادخال الصور'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      controller
                                          .uploadMultiImageToServer(images)
                                          .then((value) {
                                        Future.delayed(
                                                const Duration(seconds: 1))
                                            .then((v) {
                                          controller.addNewItem();
                                        });
                                      });
                                    }
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          const SizedBox(
                            height: 110,
                          )
                        ],
                      ),
                    );
                  })));
        }));
  }
}
