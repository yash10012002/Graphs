import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class RangeAreaChart extends StatefulWidget {
  const RangeAreaChart({super.key});

  @override
  State<RangeAreaChart> createState() => _RangeAreaChartState();
}

class _RangeAreaChartState extends State<RangeAreaChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, decimalPlaces: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Range Area Chart"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: _buildRangeAreaChart(),
      ),
    );
  }

  /// Returns the Cartesian Range area chart.
  SfCartesianChart _buildRangeAreaChart() {
    return SfCartesianChart(
      title: const ChartTitle(text: 'Average temperature variation'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.y(),
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value}°C',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getRangeAreaSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Gets the random data for the Rnage area chart series.
  List<ChartSampleData> _getData() {
    List<ChartSampleData> chartData;
    chartData = <ChartSampleData>[];
    double value = 30;
    for (int i = 0; i < 100; i++) {
      final Random yValue = Random();
      (yValue.nextDouble() > .5)
          ? value += Random().nextDouble()
          : value -= Random().nextDouble();

      chartData.add(ChartSampleData(
          x: DateTime(2000, i + 2, i), high: value, low: value + 10));
    }
    return chartData;
  }

  /// Returns the list of Chart series
  /// which need to render on the Range area chart.
  List<CartesianSeries<ChartSampleData, DateTime>> _getRangeAreaSeries() {
    return <CartesianSeries<ChartSampleData, DateTime>>[
      RangeAreaSeries<ChartSampleData, DateTime>(
        dataSource: _getData(),
        name: 'London',
        opacity: 0.5,
        borderColor: const Color.fromRGBO(50, 198, 255, 1),
        color: const Color.fromRGBO(50, 198, 255, 1),
        borderDrawMode: RangeAreaBorderMode.excludeSides,
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        highValueMapper: (ChartSampleData sales, _) => sales.high,
        lowValueMapper: (ChartSampleData sales, _) => sales.low,
      )
    ];
  }
}
