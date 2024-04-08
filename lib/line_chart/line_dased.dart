import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineDashed extends StatefulWidget {
  const LineDashed({super.key});

  @override
  State<LineDashed> createState() => _LineDashedState();
}

class _LineDashedState extends State<LineDashed> {
  List<_ChartData>? chartData;

  @override
  void initState() {
    chartData = <_ChartData>[
      _ChartData(2010, 6.6, 9.0, 15.1, 18.8),
      _ChartData(2011, 6.3, 9.3, 15.5, 18.5),
      _ChartData(2012, 6.7, 10.2, 14.5, 17.6),
      _ChartData(2013, 6.7, 10.2, 13.9, 16.1),
      _ChartData(2014, 6.4, 10.9, 13, 17.2),
      _ChartData(2015, 6.8, 9.3, 13.4, 18.9),
      _ChartData(2016, 7.7, 10.1, 14.2, 19.4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDashedLineChart();
  }

  /// Get the cartesian chart with dashed line series
  SfCartesianChart _buildDashedLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Capital investment as a share of exports'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: const NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(width: 0),
          interval: 2),
      primaryYAxis: NumericAxis(
          minimum: 3,
          maximum: 21,
          interval: 3,
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDashedLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns dashed line series to chart.
  List<LineSeries<_ChartData, num>> _getDashedLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(

          /// The property uses to render a line with dashes.
          dashArray: const <double>[15, 3, 3, 3],
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          name: 'Singapore',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          dataSource: chartData,
          dashArray: const <double>[15, 3, 3, 3],
          name: 'Saudi Arabia',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          dataSource: chartData,
          dashArray: const <double>[15, 3, 3, 3],
          name: 'Spain',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          dataSource: chartData,
          dashArray: const <double>[15, 3, 3, 3],
          name: 'Portugal',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y4,
          markerSettings: const MarkerSettings(isVisible: true)),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2, this.y3, this.y4);

  final double x;
  final double y;
  final double y2;
  final double y3;
  final double y4;
}
