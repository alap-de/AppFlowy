import 'package:appflowy/generated/flowy_svgs.g.dart';
import 'package:appflowy/plugins/database/grid/presentation/widgets/header/field_type_extension.dart';
import 'package:flowy_infra/theme_extension.dart';

import 'package:flowy_infra_ui/style_widget/button.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../filter_info.dart';

class ChoiceChipButton extends StatelessWidget {
  final FilterInfo filterInfo;
  final VoidCallback? onTap;
  final String filterDesc;

  const ChoiceChipButton({
    super.key,
    required this.filterInfo,
    this.filterDesc = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      color: AFThemeExtension.of(context).toggleOffFill,
      width: 1.0,
    );

    final decoration = BoxDecoration(
      color: Colors.transparent,
      border: Border.fromBorderSide(borderSide),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
    );

    return SizedBox(
      height: 28,
      child: FlowyButton(
        decoration: decoration,
        useIntrinsicWidth: true,
        text: FlowyText(
          filterInfo.fieldInfo.field.name,
          color: AFThemeExtension.of(context).textColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        radius: const BorderRadius.all(Radius.circular(14)),
        leftIcon: FlowySvg(
          filterInfo.fieldInfo.fieldType.icon(),
          color: Theme.of(context).iconTheme.color,
        ),
        rightIcon: _ChoicechipFilterDesc(filterDesc: filterDesc),
        hoverColor: AFThemeExtension.of(context).lightGreyHover,
        onTap: onTap,
      ),
    );
  }
}

class _ChoicechipFilterDesc extends StatelessWidget {
  final String filterDesc;
  const _ChoicechipFilterDesc({this.filterDesc = ''});

  @override
  Widget build(BuildContext context) {
    final arrow = Transform.rotate(
      angle: -math.pi / 2,
      child: FlowySvg(
        FlowySvgs.arrow_left_s,
        color: AFThemeExtension.of(context).textColor,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          if (filterDesc.isNotEmpty) FlowyText(': $filterDesc'),
          arrow,
        ],
      ),
    );
  }
}
