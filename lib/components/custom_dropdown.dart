import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../style/colors.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<Map<String, Object>>? items;
  final String? hint;
  final double? height, iconSize;
  final TextStyle? textStyle;
  final Function(Object?)? onChangeValue;
  final String? Function(Object?)? validator;

  const CustomDropdownButton({
    Key? key,
    this.items,
    this.hint,
    this.validator,
    this.height,
    this.iconSize,
    this.textStyle,
    this.onChangeValue,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

String? selectedValue;

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration:
          InputDecoration(contentPadding: EdgeInsets.zero, isDense: true),
      isExpanded: true,
      hint: Text(
        widget.hint == null ? 'Pilih Items' : widget.hint!,
        style: widget.textStyle == null
            ? Theme.of(context).textTheme.bodyText2
            : widget.textStyle!,
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      icon: Iconify(Mdi.arrow_drop_down, color: kPrimaryTextColor),
      iconOnClick: Iconify(Mdi.arrow_drop_up, color: kPrimaryTextColor),
      iconSize: widget.iconSize == null ? 30 : widget.iconSize!,
      buttonHeight: widget.height ?? 60,
      buttonPadding: const EdgeInsets.only(left: 15, right: 5),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      items: widget.items
          ?.map((item) => DropdownMenuItem<Object>(
                value: item['value'],
                child: Text(item['text'].toString(),
                    style: widget.textStyle == null
                        ? Theme.of(context).textTheme.bodyText2
                        : widget.textStyle!),
              ))
          .toList(),
      onChanged: widget.onChangeValue,
      validator: widget.validator,
      
      onSaved: (value) {
        // selectedValue = value.toString();
      },
    );
  }
}
