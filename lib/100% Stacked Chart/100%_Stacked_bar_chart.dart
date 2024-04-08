import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FullStackedBarChart extends StatefulWidget {
  const FullStackedBarChart({super.key});

  @override
  State<FullStackedBarChart> createState() => _FullStackedBarChartState();
}

class _FullStackedBarChartState extends State<FullStackedBarChart> {
  List<_ChartData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <_ChartData>[
      _ChartData('Jan', 6, 6, 1),
      _ChartData('Feb', 8, 8, 1.5),
      _ChartData('Mar', 12, 11, 2),
      _ChartData('Apr', 15.5, 16, 2.5),
      _ChartData('May', 20, 21, 3),
      _ChartData('June', 24, 25, 3.5),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedBar100Chart();
  }

  /// Returns the cartesian stacked bar 100 chart.
  SfCartesianChart _buildStackedBar100Chart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 1,
      title: ChartTitle(text: 'Sales comparison of fruits'),
      legend: Legend(isVisible: true),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          rangePadding: ChartRangePadding.none,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedBarSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the stacked bar 100 chart.
  List<CartesianSeries<_ChartData, String>> _getStackedBarSeries() {
    return <CartesianSeries<_ChartData, String>>[
      StackedBar100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.apple,
          name: 'Apple'),
      StackedBar100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.orange,
          name: 'Orange'),
      StackedBar100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.wastage,
          name: 'Wastage')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the stacked bar 100 series data points.
class _ChartData {
  _ChartData(this.x, this.apple, this.orange, this.wastage);

  final String x;
  final num apple;
  final num orange;
  final num wastage;
}
