import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/colors.dart';

import '../navbar.dart';

class TabItemWidget extends StatelessWidget {
  final bool isActive;
  final NavBar item;
  final VoidCallback? onActiveTap;

  const TabItemWidget({
    required this.item,
    Key? key,
    this.isActive = false,
    this.onActiveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onTap: isActive
            ? () {
                if (isActive && onActiveTap != null) {
                  onActiveTap!();
                }
              }
            : null,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, item.id == 2 ? 0 : 8, 0, 0),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (item.id != 2)
                SvgPicture.asset(
                  item.icon,
                  color: isActive ? activeColor : inactiveColor,
                ),
              if (item.id == 2)
                SvgPicture.asset(
                  item.icon,
                 
                  color: isActive ? activeColor : inactiveColor,
                ),
              // const SizedBox(height: 4),
              Text(
                item.title,
                style: TextStyle(
                  color: isActive ? activeColor : inactiveColor,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      );
}
