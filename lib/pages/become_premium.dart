import 'package:flutter/material.dart';
import 'package:fitness/constants.dart';
import 'package:flutter_svg/svg.dart';

class BecomePremium extends StatelessWidget {
  const BecomePremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/bgs/become_premium.jpeg'),
              fit: BoxFit.cover,
            )),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 100, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        PASATE_A_PREMIUM,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 40),
                      _createListContainerElement('+ Música'),
                      const SizedBox(height: 20),
                      _createListContainerElement('Acceso a eventos en zoom'),
                      const SizedBox(height: 20),
                      _createListContainerElement('Meditaciones guiadas'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container _createListContainerElement(String title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(100)),
      child: _createListTextElement(title),
    );
  }

  Text _createListTextElement(String title) {
    return Text(title,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500));
  }
}
