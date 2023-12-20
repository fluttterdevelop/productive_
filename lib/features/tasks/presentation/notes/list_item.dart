import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String desc;
  final String date;
  final String? image;
  final bool isAudio;
  final Function onDelete;

  const ListItem({
    super.key,
    required this.title,
    required this.desc,
    required this.date,
    this.image,
    required this.isAudio,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: (s) {},
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              color:textFieldBackgroundColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (isAudio)
                          Container(
                            child: Image.asset("assets/images/audio.png"),
                            height: 24,
                            width: 24,
                            // decoration: const BoxDecoration(color: Colors.blue),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              if (image != null)
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      image!,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
