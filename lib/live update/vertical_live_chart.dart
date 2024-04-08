import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class VerticalLiveChart extends StatefulWidget {
  const VerticalLiveChart({super.key});

  @override
  State<VerticalLiveChart> createState() => _VerticalLiveChartState();
}

class _VerticalLiveChartState extends State<VerticalLiveChart> {
  _VerticalLiveChartState() {
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: -4),
      ChartSampleData(x: 1, y: 3),
      ChartSampleData(x: 2, y: -3),
      ChartSampleData(x: 3, y: 2),
      ChartSampleData(x: 4, y: -2),
      ChartSampleData(x: 5, y: 0),
      ChartSampleData(x: 6, y: -3),
      ChartSampleData(x: 7, y: 4),
      ChartSampleData(x: 8, y: 0),
      ChartSampleData(x: 9, y: 0),
      ChartSampleData(x: 10, y: 0)
    ];
  }

  Timer? timer;
  late int count;
  ChartSeriesController<ChartSampleData, num>? _chartSeriesController;
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    count = 0;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: 0),
    ];
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 10), _updateData);
  }

  @override
  void dispose() {
    count = 0;
    chartData = <ChartSampleData>[];
    timer?.cancel();
    _chartSeriesController = null;
    chartData!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalLineUpdateChart();
  }

  /// Returns the vertical live update cartesian chart.
  SfCartesianChart _buildVerticalLineUpdateChart() {
    return SfCartesianChart(
      isTransposed: true,
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        title: AxisTitle(text: 'Time(s)'),
        majorGridLines: const MajorGridLines(color: Colors.transparent),
      ),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Velocity(m/s)'), minimum: -15, maximum: 15),
      series: _getVerticalLineSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the vertical live update chart.
  List<LineSeries<ChartSampleData, num>> _getVerticalLineSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
        onRendererCreated:
            (ChartSeriesController<ChartSampleData, num> controller) {
          _chartSeriesController = controller;
        },
        dataSource: chartData,
        animationDuration: 0,
        xValueMapper: (ChartSampleData sales, _) => sales.x as num,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }

  ///Update the data points
  void _updateData(Timer timer) {
    chartData = _getChartData();
    _chartSeriesController?.updateDataSource(
      addedDataIndexes: <int>[chartData!.length - 1],
    );
  }

  ///Get random value
  int _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  ///Get the chart data points
  List<ChartSampleData> _getChartData() {
    count = count + 1;
    if (count > 350 || chartData!.length > 350) {
      timer?.cancel();
    } else if (count > 300) {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(0, 1)));
    } else if (count > 250) {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(-2, 1)));
    } else if (count > 180) {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(-3, 2)));
    } else if (count > 100) {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(-7, 6)));
    } else if (count < 50) {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(-3, 3)));
    } else {
      chartData!
          .add(ChartSampleData(x: chartData!.length, y: _getRandomInt(-9, 9)));
    }
    return chartData!;
  }
}
