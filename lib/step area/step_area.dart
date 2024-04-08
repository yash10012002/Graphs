import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StepAreaChart extends StatefulWidget {
  const StepAreaChart({super.key});

  @override
  State<StepAreaChart> createState() => _StepAreaChartState();
}

class _StepAreaChartState extends State<StepAreaChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step Area Chart"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: _buildStepAreaChart(),
      ),
    );
  }

  SfCartesianChart _buildStepAreaChart() {
    return SfCartesianChart(
      legend: const Legend(isVisible: true),
      title: const ChartTitle(text: 'Temperature variation of Paris'),
      plotAreaBorderWidth: 0,
      primaryXAxis: const DateTimeAxis(
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value}°C',
          interval: 2,
          maximum: 16,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStepAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<_StepAreaData>? chartData;

  @override
  void initState() {
    chartData = <_StepAreaData>[
      _StepAreaData(DateTime(2019, 3), 12, 9),
      _StepAreaData(DateTime(2019, 3, 2), 13, 7),
      _StepAreaData(DateTime(2019, 3, 3), 14, 10),
      _StepAreaData(DateTime(2019, 3, 4), 12, 5),
      _StepAreaData(DateTime(2019, 3, 5), 12, 4),
      _StepAreaData(DateTime(2019, 3, 6), 12, 8),
      _StepAreaData(DateTime(2019, 3, 7), 13, 6),
      _StepAreaData(DateTime(2019, 3, 8), 12, 4),
      _StepAreaData(DateTime(2019, 3, 9), 15, 8),
      _StepAreaData(DateTime(2019, 3, 10), 14, 7),
      _StepAreaData(DateTime(2019, 3, 11), 10, 3),
      _StepAreaData(DateTime(2019, 3, 12), 13, 4),
      _StepAreaData(DateTime(2019, 3, 13), 12, 4),
      _StepAreaData(DateTime(2019, 3, 14), 11, 6),
      _StepAreaData(DateTime(2019, 3, 15), 14, 10),
      _StepAreaData(DateTime(2019, 3, 16), 14, 9),
      _StepAreaData(DateTime(2019, 3, 17), 11, 4),
      _StepAreaData(DateTime(2019, 3, 18), 11, 2),
    ];
    super.initState();
  }

  /// Returns the list of chart series
  /// which need to render on teh step area chart.
  List<CartesianSeries<_StepAreaData, DateTime>> _getStepAreaSeries() {
    return <CartesianSeries<_StepAreaData, DateTime>>[
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        name: 'High',
        xValueMapper: (_StepAreaData sales, _) => sales.x,
        yValueMapper: (_StepAreaData sales, _) => sales.high,
      ),
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.6),
        name: 'Low',
        xValueMapper: (_StepAreaData sales, _) => sales.x,
        yValueMapper: (_StepAreaData sales, _) => sales.low,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the step area chart data point.
class _StepAreaData {
  _StepAreaData(this.x, this.high, this.low);

  final DateTime x;
  final double high;
  final double low;
}
