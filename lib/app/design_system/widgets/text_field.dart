import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_flutter/app/design_system/spacing.dart';

class ExpTextField extends StatelessWidget {
  const ExpTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.enabled = true,
    this.onChanged,
    this.textStyle,
    this.textAlignVertical,
    this.hint = '',
    this.label = '',
    this.onTap,
    this.suffix,
    this.prefix,
    this.counterText,
  });

  ExpTextField.number({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.center,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    List<TextInputFormatter>? inputFormatters,
    this.enabled = true,
    this.onChanged,
    this.textStyle,
    this.textAlignVertical,
    this.hint = '',
    this.label = '',
    this.keyboardType = TextInputType.number,
  })  : inputFormatters = inputFormatters ??
            [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
        onTap = null,
        suffix = null,
        prefix = null,
        counterText = null;

  const ExpTextField.dropDown({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.textAlignVertical,
    this.hint = '',
    this.label = '',
    this.onTap,
  })  : prefix = null,
        suffix = const Icon(Icons.arrow_drop_down),
        readOnly = true,
        inputFormatters = null,
        textAlign = TextAlign.start,
        keyboardType = null,
        textStyle = null,
        counterText = null;

  final TextEditingController? controller;

  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final bool readOnly;

  final bool obscureText;
  final int maxLines;
  final int? minLines;

  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Widget? suffix;
  final Widget? prefix;
  final String hint;
  final String label;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: readOnly ? Theme.of(context).colorScheme.outline : Theme.of(context).colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        contentPadding: const EdgeInsets.only(
          left: Spacing.s_16,
          right: Spacing.s_16,
          bottom: Spacing.s_16,
        ),
        counterText: counterText ?? '',
        prefixIcon: prefix,
        suffixIcon: suffix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).hintColor),
        label: label.isNotEmpty ? Text(label) : null,
      ),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      enabled: enabled,
      onChanged: onChanged,
      textAlignVertical: textAlignVertical,
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
      onTap: onTap,
    );
  }
}
