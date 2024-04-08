import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnimationLineChart extends StatefulWidget {
  const AnimationLineChart({super.key});

  @override
  State<AnimationLineChart> createState() => _AnimationLineChartState();
}

class _AnimationLineChartState extends State<AnimationLineChart> {
  Timer? _timer;
  List<_ChartData>? _chartData;

  @override
  Widget build(BuildContext context) {
    _getChartData();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _getChartData();
      });
    });

    return _buildAnimationLineChart();
  }

  ///Get the cartesian chart with line series
  SfCartesianChart _buildAnimationLineChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis:
            const NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: const NumericAxis(
            majorTickLines: MajorTickLines(color: Colors.transparent),
            axisLine: AxisLine(width: 0),
            minimum: 0,
            maximum: 100),
        series: _getDefaultLineSeries());
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _chartData!.clear();
  }

  int _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  void _getChartData() {
    _chartData = <_ChartData>[];
    for (int i = 0; i < 11; i++) {
      _chartData!.add(_ChartData(i, _getRandomInt(5, 95)));
    }
    _timer?.cancel();
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final int x;
  final int y;
}
