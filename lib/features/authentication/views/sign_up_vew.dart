
import 'package:delivery_app/features/authentication/views/verification_view.dart';
import 'package:delivery_app/global_widgets/global_button_widget.dart';
import 'package:delivery_app/global_widgets/global_circular_button_widget.dart';
import 'package:delivery_app/global_widgets/global_padding_widget.dart';
import 'package:delivery_app/global_widgets/global_text_field_widget.dart';
import 'package:delivery_app/resources/colors_manager.dart';
import 'package:delivery_app/resources/routes_manager.dart';
import 'package:delivery_app/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isButtonEnabled = false;

 late String name, phone, location;

  void _checkIfFieldsAreFilled() {
    final isFilled = _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty && _locationController.text.isNotEmpty;

    setState(() {
      isButtonEnabled = isFilled;
    });
  }


 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfFieldsAreFilled);
    _phoneController.addListener(_checkIfFieldsAreFilled);
    _locationController.addListener(_checkIfFieldsAreFilled);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: GlobalPaddingWidget(
          child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalCircularButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  iconColor: ColorManager.black,
                  icon: Icons.arrow_back,
                ),
                 SizedBox(
                  height: AppSize.s20.h,
                ),
                Text("أنشئ حسابًا",
                    style: Theme.of(context).textTheme.displayMedium),
                 SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                    "انضم إلينا اليوم لفتح الميزات، إدارة الطلبات، والبقاء على اتصال باحتياجاتك من التوصيل!",
                    style: Theme.of(context).textTheme.labelSmall),
                 SizedBox(
                  height: AppSize.s20.h,
                ),
                Text("الاسم بالكامل",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium),
                 SizedBox(
                  height: AppSize.s10.h,
                ),
                 GlobalTextFieldWidget(
                   validator: (val){
                     if(val!.length < 10){
                       return "ادخل الاسم بالكامل";
                     }
                     return null;
                   },
                   onSaved: (value) => name = value!,
                  controller: _nameController,
                  hintText: "الاسم بالكامل",
                  textInputType: TextInputType.text,
                ),
                 SizedBox(
                  height: AppSize.s30.h,
                ),
                Text("رقم الهاتف",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                 GlobalTextFieldWidget(
                   letterSpacing: 3.0,
                   validator: (value){
                     if(value!.length != 11){
                       return "ادخل رقم هاتف صحيح";
                     }
                     return null;
                   },
                   onSaved: (value) => phone = value!,
                  controller: _phoneController,
                  hintText: "رقم الهاتف",
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                Text("العنوان بالتفصيل",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium),
                SizedBox(
                  height: AppSize.s10.h,
                ),
                GlobalTextFieldWidget(
                  validator: (val){
                    if(val!.length < 10){
                      return "ادخل عنوانك";
                    }
                    return null;
                  },
                  onSaved: (value) => location = value!,
                  controller: _locationController,
                  height: AppSize.s80.h,
                  hintText: "أدخل عنوانك",
                  textInputType: TextInputType.multiline,
                ),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                GlobalButtonWidget(
                  isButtonEnabled: isButtonEnabled,
                  width: double.infinity,
                  text: "متابعة",
                  onTap:isButtonEnabled? () {
                    Navigator.pushNamed(context, VerificationView.id);
                  }: (){},
                ),
                 SizedBox(
                  height: AppSize.s100.h,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
