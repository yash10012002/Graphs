import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';
import 'dart:math' as math;

class RealTimeSplineChart extends StatefulWidget {
  const RealTimeSplineChart({super.key});

  @override
  State<RealTimeSplineChart> createState() => _RealTimeSplineChartState();
}

class _RealTimeSplineChartState extends State<RealTimeSplineChart> {
  _RealTimeSplineChartState() {
    chartData1 = <ChartSampleData>[
      ChartSampleData(x: 0, y: 0),
      ChartSampleData(x: 1, y: -2),
      ChartSampleData(x: 2, y: 2),
      ChartSampleData(x: 3, y: 0)
    ];
    chartData2 = <ChartSampleData>[
      ChartSampleData(x: 0, y: 0),
      ChartSampleData(x: 1, y: 2),
      ChartSampleData(x: 2, y: -2),
      ChartSampleData(x: 3, y: 0)
    ];
    timer = Timer.periodic(const Duration(milliseconds: 50), _updateData);
  }

  Timer? timer;
  List<ChartSampleData>? chartData1;
  List<ChartSampleData>? chartData2;
  bool canStopTimer = false;
  int? wave1, wave2;
  late int count;

  @override
  void initState() {
    count = 1;
    chartData1 = <ChartSampleData>[
      ChartSampleData(x: 0, y: 0),
    ];
    chartData2 = <ChartSampleData>[
      ChartSampleData(x: 0, y: 0),
    ];
    super.initState();
    wave1 = 0;
    wave2 = 180;
    if (chartData1!.isNotEmpty && chartData2!.isNotEmpty) {
      chartData1!.clear();
      chartData2!.clear();
    }
    _updateLiveData();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLiveUpdateChart();
  }

  ///Get the cartesian chart widget
  SfCartesianChart _buildLiveUpdateChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: _getLiveUpdateSeries(),
    );
  }

  ///Get the series which contains live updated data points
  List<SplineSeries<ChartSampleData, num>> _getLiveUpdateSeries() {
    return <SplineSeries<ChartSampleData, num>>[
      SplineSeries<ChartSampleData, num>(
        dataSource: [...chartData1!],
        xValueMapper: (ChartSampleData sales, _) => sales.x as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        animationDuration: 0,
      ),
      SplineSeries<ChartSampleData, num>(
        dataSource: [...chartData2!],
        xValueMapper: (ChartSampleData sales, _) => sales.x as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        animationDuration: 0,
      )
    ];
  }

  void _updateData(Timer timer) {
    if (mounted) {
      setState(() {
        chartData1!.removeAt(0);
        chartData1!.add(ChartSampleData(
          x: wave1,
          y: math.sin(wave1! * (math.pi / 180.0)),
        ));
        chartData2!.removeAt(0);
        chartData2!.add(ChartSampleData(
          x: wave1,
          y: math.sin(wave2! * (math.pi / 180.0)),
        ));
        wave1 = wave1! + 1;
        wave2 = wave2! + 1;
      });
    }
  }

  void _updateLiveData() {
    for (int i = 0; i < 180; i++) {
      chartData1!
          .add(ChartSampleData(x: i, y: math.sin(wave1! * (math.pi / 180.0))));
      wave1 = wave1! + 1;
    }

    for (int i = 0; i < 180; i++) {
      chartData2!
          .add(ChartSampleData(x: i, y: math.sin(wave2! * (math.pi / 180.0))));
      wave2 = wave2! + 1;
    }

    wave1 = chartData1!.length;
  }
}
