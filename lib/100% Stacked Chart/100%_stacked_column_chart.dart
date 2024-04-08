import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FullStackedColumnChart extends StatefulWidget {
  const FullStackedColumnChart({super.key});

  @override
  State<FullStackedColumnChart> createState() => _FullStackedColumnChartState();
}

class _FullStackedColumnChartState extends State<FullStackedColumnChart> {
  List<_ChartData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <_ChartData>[
      _ChartData('Q1', 50, 55, 72, 65),
      _ChartData('Q2', 80, 75, 70, 60),
      _ChartData('Q3', 35, 45, 55, 52),
      _ChartData('Q4', 65, 50, 70, 65),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedColumn100Chart();
  }

  /// Returns the cartesian stacked column 100 chart.
  SfCartesianChart _buildStackedColumn100Chart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Quarterly wise sales of products'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          rangePadding: ChartRangePadding.none,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the stacked column 1oo chart.
  List<CartesianSeries<_ChartData, String>> _getStackedColumnSeries() {
    return <CartesianSeries<_ChartData, String>>[
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y1,
          name: 'Product A'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          name: 'Product B'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          name: 'Product C'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y4,
          name: 'Product D')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the stacked column series data points.
class _ChartData {
  _ChartData(this.x, this.y1, this.y2, this.y3, this.y4);

  final String x;
  final num y1;
  final num y2;
  final num y3;
  final num y4;
}
