import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_outlined_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class CardButtonComponent extends StatelessWidget {
  final String title;
  final bool isColored;
  final VoidCallback? onPressed;

  const CardButtonComponent({
    required this.title,
    required this.isColored,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      height: Sizes.buttonHeight46(context),
      width: Sizes.buttonWidth140(context),
      side: isColored
          ? null
          : BorderSide(color: customColors(context).greyColor!),
      buttonColor: isColored ? null : Colors.transparent,
      splashColor: isColored ? null : Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      child: CustomText.f14(
        context,
        title,
        color: isColored ? customColors(context).whiteColor : null,
        weight: FontStyles.fontWeightSemiBold,
        alignment: Alignment.center,
      ),
    );
  }
}
