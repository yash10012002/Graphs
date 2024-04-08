import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultRangeColumn extends StatefulWidget {
  const DefaultRangeColumn({super.key});

  @override
  State<DefaultRangeColumn> createState() => _DefaultRangeColumnState();
}

class _DefaultRangeColumnState extends State<DefaultRangeColumn> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultRangeColumnChart();
  }

  /// Returns the default range column chart.
  SfCartesianChart _buildDefaultRangeColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Average half-yearly temperature variation of London, UK'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          interval: 2,
          labelFormat: '{value}°C',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultRangeColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Retursn the list of chart series
  /// which need to render on the default range column chart.
  List<RangeColumnSeries<ChartSampleData, String>>
      _getDefaultRangeColumnSeries() {
    return <RangeColumnSeries<ChartSampleData, String>>[
      RangeColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Jan', y: 3, yValue: 6),
          ChartSampleData(x: 'Feb', y: 3, yValue: 7),
          ChartSampleData(x: 'Mar', y: 4, yValue: 10),
          ChartSampleData(x: 'Apr', y: 6, yValue: 13),
          ChartSampleData(x: 'May', y: 9, yValue: 17),
          ChartSampleData(x: 'June', y: 12, yValue: 20),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        lowValueMapper: (ChartSampleData sales, _) => sales.y,
        highValueMapper: (ChartSampleData sales, _) => sales.yValue,
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
            textStyle: const TextStyle(fontSize: 10)),
      )
    ];
  }
}
