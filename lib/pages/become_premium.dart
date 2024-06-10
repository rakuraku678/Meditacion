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
                    icon: Icon(Icons.close),
                    iconSize: 30,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Positioned(
                  top: 100,
                  left: 5,
                  right: 5,
                  child: Center(
                      child: Text(
                    PASATE_A_PREMIUM,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Positioned(
                  top: 150,
                  //left: 50,
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            textAlign: TextAlign.left,
                            '+ Musica',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.left,
                            'Eventos en zoom',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
