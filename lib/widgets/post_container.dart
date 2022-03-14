import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4),
                Text(
                  post.caption,
                  textAlign: TextAlign.left,
                ),
                post.imageUrl != null
                    ? const SizedBox(height: 6)
                    : const SizedBox.shrink()
              ],
            ),
          ),
          post.imageUrl != null
              ? CachedNetworkImage(imageUrl: post.imageUrl as String)
              : const SizedBox.shrink(),
          _PostStats(post: post),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              const _BlueLikeIcon(),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Text(
                '${post.comments} Shares',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                onTap: () => print('Like'),
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  size: 20,
                  color: Colors.grey[600],
                ),
                label: 'Like',
              ),
              _PostButton(
                onTap: () => print('Comment'),
                icon: Icon(
                  MdiIcons.commentOutline,
                  size: 20,
                  color: Colors.grey[600],
                ),
                label: 'Commend',
              ),
              _PostButton(
                onTap: () => print('Share'),
                icon: Icon(
                  MdiIcons.shareOutline,
                  size: 25,
                  color: Colors.grey[600],
                ),
                label: 'Share',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BlueLikeIcon extends StatelessWidget {
  const _BlueLikeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Palette.facebookBlue,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 10,
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  final String label;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
