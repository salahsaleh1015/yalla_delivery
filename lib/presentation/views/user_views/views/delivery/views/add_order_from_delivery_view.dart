import 'package:delivery_app/presentation/models/delivery_model.dart';
import 'package:delivery_app/presentation/models/order_info_model.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_app_bar.dart';
import 'package:delivery_app/presentation/views/global_widgets/global_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../models/user_and_delivery_combined_model.dart';
import '../../../../global_widgets/global_button_widget.dart';
import '../../../../global_widgets/global_custom_order_text_field.dart';

class AddOrderFromDeliveryView extends StatefulWidget {
  const AddOrderFromDeliveryView({
    super.key,
    required this.deliveryModel,
  });
  final DeliveryModel deliveryModel;
  @override
  State<AddOrderFromDeliveryView> createState() =>
      _AddOrderFromDeliveryViewState();
}

class _AddOrderFromDeliveryViewState extends State<AddOrderFromDeliveryView> {
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
    return Scaffold(
      body: GlobalPaddingWidget(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalAppBar(
              title: "اضافة طلب",
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
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, Routes.orderSummaryRoute,
                      arguments: OrderInfoModel(
                          deliveryModel: widget.deliveryModel, order: order));
                }
              },
              width: double.infinity,
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _orderController.dispose();
    super.dispose();
  }
}
