import 'package:flutter/material.dart';

import '../constants.dart';

class CustomLiveButton extends StatelessWidget {
  const CustomLiveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenHeight(context) * 0.04,
      width: screenWidth(context) / 7,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Stack(
            clipBehavior: Clip.none,
            children:  [
              Positioned(
                left: 30,
                bottom: 5,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: white,
                ),
              ),
              Text(
                "Live",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
