import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwoButtonsWidget extends StatelessWidget {
  final String lat;
  final String lnb;
  const TwoButtonsWidget({
    Key? key,
    required this.lat,
    required this.lnb,
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
              onPressed: () async {
                final url =
                    'https://www.google.com/maps/search/?api=1&query=$lat,$lnb';

                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Icon(Icons.pin_drop),
            ),
          ),
        ],
      ),
    );
  }
}
