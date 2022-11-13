import 'package:flutter/material.dart';

class ProfilePageIconWithDescription extends StatelessWidget {
  const ProfilePageIconWithDescription({
    Key? key,
    required this.username,
    required this.email
  }) : super(key: key);

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: screenWidth * 0.04,
              bottom: screenHeight * 0.01),
          child: Text(
            username,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: screenHeight * 0.01),
          child: Text(
            email,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
