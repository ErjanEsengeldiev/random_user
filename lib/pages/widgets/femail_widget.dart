import 'package:flutter/material.dart';

class FemailButtonsWidget extends StatelessWidget {
  final String gender;
  const FemailButtonsWidget({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(
                gender == 'female'
                    ? const Color.fromARGB(221, 32, 32, 32)
                    : Colors.white38,
              ),
            ),
            onPressed: () {},
            child: const Text('Men'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(
                  gender == 'male'
                      ? const Color.fromARGB(221, 32, 32, 32)
                      : Colors.white38,
                )),
            onPressed: () {},
            child: const Text('Women'),
          ),
        ),
      ],
    );
  }
}