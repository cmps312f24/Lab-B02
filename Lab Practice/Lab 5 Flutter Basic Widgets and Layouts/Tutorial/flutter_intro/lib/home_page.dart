import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade500,
      child: const SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome to Flutter",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
              Icon(
                Icons.transfer_within_a_station,
                color: Colors.white,
                size: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 80),
                child: Icon(
                  Icons.transfer_within_a_station,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              Icon(
                Icons.transfer_within_a_station,
                color: Colors.white,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
