import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wattway_by_colas/application/setting/setting_controller.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_value_card.dart';
import 'package:wattway_by_colas/domain/setting/models/setting_value_properties.dart';
import 'package:wattway_by_colas/presentation/core/theme/app_colors.dart';
import 'package:wattway_by_colas/presentation/shared/rounded_button.dart';

class SettingConfigurationBottomSheet extends GetView<SettingController> {
  final String categoryName;
  final SettingValueCard value;
  final SettingValueProperties valueProperties;

  SettingConfigurationBottomSheet(
      {required this.categoryName, required this.value, required this.valueProperties});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: categoryName,
                style: TextStyle(
                  color: Color(textColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(text: " - "),
                  TextSpan(
                      text: ('setting_value_' + EnumToString.convertToString(value.property)).tr),
                ],
              ),
            ),
          ),
        ),
        buildSelector(context),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                onPressed: () => controller.sendParamToBoard(),
                label: 'save'.tr,
              ),
              const SizedBox(height: 10),
              RoundedButton(
                onPressed: Get.back,
                colors: [
                  Color(0xffFF3C2B),
                  Color(0xffDB1F1F),
                ],
                label: 'cancel'.tr,
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }

  Widget buildSelector(BuildContext context) {
    if (value.possibleValues != null) {
      return _buildPicker(context);
    } else if (value.rangeValues != null) {
      return _buildRangeValues(context);
    } else {
      return _buildInput(context);
    }
  }

  Widget _buildPicker(BuildContext context) {
    controller.picker = Picker(
      adapter: PickerDataAdapter<String>(
        pickerdata: value.possibleValues,
        isArray: false,
      ),
      hideHeader: true,
      selecteds: [value.possibleValues!.indexWhere((e) => e == valueProperties.value)],
      selectedTextStyle: TextStyle(color: Color(primaryColor)),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      },
    );

    controller.sendParamToBoard = () {
      final values = controller.picker.getSelectedValues();
      print(values);
    };

    return controller.picker.makePicker();
  }

  Widget _buildInput(BuildContext context) {
    return FormBuilder(
      key: controller.dataEdit,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: controller.dataTextController,
            name: "value",
            autocorrect: false,
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                context,
                errorText: 'error_form_required'.tr,
              ),
            ]),
            decoration: InputDecoration(
              labelText: "Entrez une valeur" + (value.unity.isNotEmpty ? " en " + value.unity : ""),
              prefixIcon: Icon(
                LineIcons.atom,
                color: Color(greyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRangeValues(BuildContext context) {
    return FormBuilder(
      key: controller.dataEdit,
      child: Column(
        children: [
          FormBuilderSlider(
            //controller: controller.dataTextController,
            name: "value",
            initialValue: double.parse(valueProperties.value),
            min: value.rangeValues!.value1.toDouble(),
            max: value.rangeValues!.value2.toDouble(),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                context,
                errorText: 'error_form_required'.tr,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
