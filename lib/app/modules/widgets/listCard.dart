import 'package:flutter/material.dart';

import 'videoDescription.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.topic,
    required this.user,
    required this.viewCount,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String topic;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: thumbnail,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$viewCount views',
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: VideoDescription(
                  title: title,
                  user: user,
                  viewCount: viewCount,
                  topic: topic,
                ),
              ),
              Column(
                children: [
                  const Icon(
                    Icons.verified_outlined,
                    color: Colors.green,
                    size: 16.0,
                  ),
                  TextButton(
                      child: Text("Chat".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.green)))),
                      onPressed: () => null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
