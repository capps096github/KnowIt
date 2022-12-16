import 'dart:math';
import 'dart:async';

import '../../../knowit_exporter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Timer timer;
  late Random random;
  late String result;
  late double degree;
  late int time;

  @override
  void initState() {
    super.initState();

    random = Random();
    degree = 0;
    result = "";
  }

  void rotateWheel() {
    time = 3000;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          result = calculatePoint(degree);
        });
        time = time - 100;
      }
    });
  }

  String calculatePoint(double degree) {
    String res = "";
    int lowpoint = 0;
    int arc = 30;
    int sectors = 12;

    for (int i = sectors; i > 0; i++) {
      if (degree > lowpoint && degree < lowpoint + arc) {
        res = i.toString();
        break;
      }
      lowpoint = lowpoint + arc;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {

    // TODO implement spinning wheel using package https://pub.dev/packages/flutter_spinning_wheel
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: 3.14 / 180 * degree,
                      child: const Image(
                        width: 350,
                        height: 350,
                        image: AssetImage(knowItSpin),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      width: 50,
                      height: 50,
                      image: AssetImage(knowItMini),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            result,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 50,
              color: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: () {
              rotateWheel();
            },
            child: const Text("Press here"),
          )
        ],
      ),
    );
  }
}
