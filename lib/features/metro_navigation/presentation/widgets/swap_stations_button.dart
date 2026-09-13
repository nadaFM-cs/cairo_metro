import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_ui/core/theme/app_colors.dart';

class SwapStationsButton extends StatelessWidget {
  final VoidCallback onPressed;
  
  const SwapStationsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
          color: AppColors.surfaceAlt,
          shape: const CircleBorder(
            side: BorderSide(
              color: AppColors.stroke
            )
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: Icon(Icons.swap_vert_rounded, color: AppColors.gold, size: 25,),
          ),
        ),
      ),
    );
  }
}
