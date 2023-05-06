
import 'package:flutter/material.dart';

import '../style/borders.dart';
import '../style/colors.dart';

class CustomDateTimePickerDialog extends StatefulWidget {
  final String? text;
  final Function(String?)? onDataChange;
  final bool enabled;
  const CustomDateTimePickerDialog({
    Key? key,
    this.text,
    this.onDataChange,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<CustomDateTimePickerDialog> createState() =>
      _CustomDateTimePickerDialogState();
}

class _CustomDateTimePickerDialogState
    extends State<CustomDateTimePickerDialog> {
  var selectedDate;
  var valueDate;
  var textDate;

  _selectDate(BuildContext context) async {
    selectedDate = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100, 12, 31),
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, child) {
        return Center(
            child: SizedBox(
          width: 500,
          height: 500,
          child: child,
        ));
      },
    );

    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        valueDate =
            '${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
        textDate =
            '${selectedDate.day.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year.toString().padLeft(2, '0')}';
      });
    }

    widget.onDataChange?.call(valueDate);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: kGreyColor),
              borderRadius: BorderRadius.circular(kInputBorder)),
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  selectedDate == null
                      ? Text(
                          widget.text == null ? 'Tanggal' : widget.text!,
                          style: Theme.of(context).textTheme.overline,
                        )
                      : Text(textDate??'',
                          style: Theme.of(context).textTheme.overline),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          // ignore: unnecessary_statements
          if (widget.enabled == true) _selectDate(context);
        },
      ),
    );
  }
}
