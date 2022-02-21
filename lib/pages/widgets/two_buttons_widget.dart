import 'package:flutter/material.dart';

class TwoButtonsWidget extends StatelessWidget {
  const TwoButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 100)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(221, 32, 32, 32))),
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 100)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(221, 32, 32, 32))),
              onPressed: () {},
              child: const Icon(Icons.pin_drop),
            ),
          ),
        ],
      ),
    );
  }
}
