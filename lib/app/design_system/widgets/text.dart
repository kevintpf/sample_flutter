import 'package:flutter/material.dart';

typedef TextThemeBuilder = TextStyle Function(ThemeData themeData);

class ExpText extends StatelessWidget {
  ExpText.displayLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.displayLarge!);

  ExpText.displaySmall(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.displaySmall!);

  ExpText.headlineLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.headlineLarge!);

  ExpText.headlineMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.headlineMedium!);

  ExpText.headlineSmall(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.headlineSmall!);

  ExpText.titleLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines = 1,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleLarge!);

  ExpText.titleMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleMedium!);

  ExpText.titleSmall(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.titleSmall!);

  ExpText.bodyLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.bodyLarge!);

  ExpText.bodyMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.bodyMedium!);

  ExpText.bodySmall(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.bodySmall!);

  ExpText.labelLarge(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.labelLarge!);

  ExpText.labelSmall(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.labelSmall!);

  ExpText.labelMedium(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.labelMedium!);

  ExpText.action(
    this.text, {
    this.textAlign,
    this.mergeStyleWith,
    this.maxLines,
    this.overflow,
    super.key,
  }) : textThemeBuilder = ((ThemeData theme) => theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.primary));

  final String text;
  final int? maxLines;
  final TextThemeBuilder textThemeBuilder;
  final TextStyle? mergeStyleWith;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: textThemeBuilder(Theme.of(context)).merge(mergeStyleWith),
      overflow: overflow,
    );
  }
}
