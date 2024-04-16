import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/styles.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String? surffix;
  final void Function(String)? onChanged;
  const CustomField(
      {super.key, required this.label, this.surffix, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 16,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterText: '',
        suffixIconConstraints:
            const BoxConstraints(minHeight: 20, minWidth: 20),
        suffixIcon: surffix == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  surffix!,
                  width: 20,
                  height: 20,
                ),
              ),
        label: Text(
          label,
          style: myTexStyle(fontSize: 18),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
