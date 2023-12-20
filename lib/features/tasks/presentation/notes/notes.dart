import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/features/tasks/presentation/notes/list_item.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> titles = [
    "Commitment resource lecture",
    "Duas",
    "Commitment resource lecture",
    "Commitment resource lecture",
    "Duas",
  ];
  List<String> desc = [
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
    "We explained the definition of commitmen..",
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
  ];
  List<bool> audio = [false, false, true, false, false];
  List<String?> images = [null, null, "assets/images/node_picture.png", null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Books",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: scaffoldBackgroundColor,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookColumn(
                  "assets/icons/tasks/green_book.svg",
                  "Password",
                ),
                _buildBookColumn(
                  "assets/icons/tasks/red_book.svg",
                  "Memories",
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/tasks/add_book.svg",
                      height: 91,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top :16.0),
                    child: Text(
                      "Quick Notes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Container(
                  
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildNotesList(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Column _buildBookColumn(String iconPath, String label) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 91,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ],
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return ListItem(
          title: titles[index],
          image: images[index],
          desc: desc[index],
          date: "15 November",
          isAudio: audio[index],
          onDelete: () {
            setState(() {
              titles.removeAt(index);
              desc.removeAt(index);
              images.removeAt(index);
              audio.removeAt(index);
            });
          },
        );
      },
    );
  }
}
