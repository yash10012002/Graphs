import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VerticalSplineChart extends StatefulWidget {
  const VerticalSplineChart({super.key});

  @override
  State<VerticalSplineChart> createState() => _VerticalSplineChartState();
}

class _VerticalSplineChartState extends State<VerticalSplineChart> {
  List<_ChartData>? chartData;

  @override
  void initState() {
    chartData = <_ChartData>[
      _ChartData('Jan', -1, 7),
      _ChartData('Mar', 12, 2),
      _ChartData('Apr', 25, 13),
      _ChartData('Jun', 31, 21),
      _ChartData('Aug', 26, 26),
      _ChartData('Oct', 14, 10),
      _ChartData('Dec', 8, 0),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalSplineChart();
  }

  /// Returns the vertical spline chart.
  SfCartesianChart _buildVerticalSplineChart() {
    return SfCartesianChart(
      isTransposed: true,
      title: ChartTitle(text: 'Climate graph - 2012'),
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: true),
      primaryXAxis: const CategoryAxis(
          majorTickLines: MajorTickLines(size: 0),
          axisLine: AxisLine(width: 0)),
      primaryYAxis: const NumericAxis(
          minimum: -10,
          maximum: 40,
          interval: 10,
          labelFormat: '{value}°C',
          majorGridLines: MajorGridLines(width: 0)),
      series: _getVerticalSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series
  /// which need to render on the vertical spline chart.
  List<SplineSeries<_ChartData, String>> _getVerticalSplineSeries() {
    return <SplineSeries<_ChartData, String>>[
      SplineSeries<_ChartData, String>(
          markerSettings: const MarkerSettings(isVisible: true),
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          name: 'London'),
      SplineSeries<_ChartData, String>(
        markerSettings: const MarkerSettings(isVisible: true),
        dataSource: chartData,
        name: 'France',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y2,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final String x;
  final double y;
  final double y2;
}
