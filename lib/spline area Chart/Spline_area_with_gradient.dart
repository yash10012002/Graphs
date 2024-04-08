import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineAreaWithGradient extends StatefulWidget {
  const SplineAreaWithGradient({super.key});

  @override
  State<SplineAreaWithGradient> createState() => _SplineAreaWithGradientState();
}

class _SplineAreaWithGradientState extends State<SplineAreaWithGradient> {
  final List<ChartData> data = [
    ChartData(17, 21500, "0"),
    ChartData(18, 22684, "1"),
    ChartData(19, 21643, "2"),
    ChartData(20, 22997, "3"),
    ChartData(21, 22883, "4"),
    ChartData(22, 22635, "5"),
    ChartData(23, 21800, "6"),
    ChartData(24, 23500, "7"),
    ChartData(25, 21354, "8"),
    ChartData(26, 22354, "9"),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff191d2d),
      child: SfCartesianChart(
        title: ChartTitle(
          text: "CartesianChart",
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 132, 200, 255),
          ),
        ),
        margin: EdgeInsets.zero,
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        borderColor: Colors.transparent,
        primaryXAxis: NumericAxis(
          minimum: 17,
          maximum: 26,
          isVisible: false,
          interval: 1,
          borderWidth: 0,
          borderColor: Colors.transparent,
        ),
        primaryYAxis: NumericAxis(
          minimum: 19000,
          maximum: 24000,
          interval: 1000,
          isVisible: false,
          borderWidth: 0,
          borderColor: Colors.transparent,
        ),
        series: <CartesianSeries<ChartData, int>>[
          SplineAreaSeries(
            splineType: SplineType.natural,
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.price,
            gradient: LinearGradient(
              colors: [
                Color(0xff243199),
                Color(0xff191d2d).withAlpha(150),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          SplineSeries(
            markerSettings: MarkerSettings(
              color: Color(0xff243199),
              borderWidth: 3,
              shape: DataMarkerType.circle,
              isVisible: true,
              borderColor: Color(0xff586af8),
            ),
            color: Color(0xff586af8),
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.price,
          )
        ],
      ),
    );
  }
}

class ChartData {
  int day = 0;
  double price = 0;
  String text = "";

  ChartData(this.day, this.price, this.text);
}
