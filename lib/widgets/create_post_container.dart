import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/models/models.dart';
import 'package:flutter_facebook_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?'),
                ),
              )
            ],
          ),
          const Divider(
            height: 2,
            thickness: 0.5,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Live',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () => print('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () => print('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text(
                    'Room',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
