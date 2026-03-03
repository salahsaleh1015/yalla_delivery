import 'package:delivery_app/core/resources/values_manager.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_custom_order_text_field.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/functions/hive_functions.dart';
import '../../../../../../domain/entities/delivery_management_entities/delivery_entity.dart';

class AddOrderView extends StatefulWidget     {
  const AddOrderView({super.key,});



  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final TextEditingController _orderController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  late String order;

  void _checkIfFieldsAreFilled() {
    final isFilled = _orderController.text.length >= 10;
    setState(() {
      isButtonEnabled = isFilled;
    });
  }

  @override
  void initState() {
    super.initState();
    _orderController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GlobalPaddingWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.s30.w,
                ),
                Text(
                  "اضافة طلب",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                // GlobalCircularButtonWidget(
                //   onTap: () {
                //     // Navigator.pushNamed(context, CartView.id);
                //   },
                //   icon: Icons.shopping_cart_outlined,
                // ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Text(
              "أضف طلبك",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            GlobalCustomOrderTextField(
              orderController: _orderController,
              onSaved: (value) {
                order = value!;
              },
              validator: (value) {
                if (value!.length < 10) {
                  return " يرجى ادخال الطلب كامل";
                }
                return null;
              },
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            GlobalButtonWidget(
              isButtonEnabled: isButtonEnabled,
              text: "استمر",
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await  clearHiveBox<DeliveryEntity>(boxName: kAvailableDeliveryBox);
                  Navigator.pushNamed(
                      context, Routes.chooseDeliveryFromAddOrderRoute,
                      arguments: order);
                  _orderController.clear();
                }
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _orderController.dispose();
    super.dispose();
  }
}
