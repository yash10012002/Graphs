import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class ColumnWithTrack extends StatefulWidget {
  const ColumnWithTrack({super.key});

  @override
  State<ColumnWithTrack> createState() => _ColumnWithTrackState();
}

class _ColumnWithTrackState extends State<ColumnWithTrack> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        header: '',
        format: 'point.y marks in point.x');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTrackerColumnChart();
  }

  /// Get column series with track
  SfCartesianChart _buildTrackerColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Marks of a student'),
      legend: Legend(isVisible: true),
      primaryXAxis:
          const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          minimum: 0,
          maximum: 100,
          axisLine: AxisLine(width: 0),
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getTracker(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Get column series with tracker
  List<ColumnSeries<ChartSampleData, String>> _getTracker() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Subject 1', y: 71),
            ChartSampleData(x: 'Subject 2', y: 84),
            ChartSampleData(x: 'Subject 3', y: 48),
            ChartSampleData(x: 'Subject 4', y: 80),
            ChartSampleData(x: 'Subject 5', y: 76),
          ],

          /// We can enable the track for column here.
          isTrackVisible: true,
          trackColor: const Color.fromRGBO(198, 201, 207, 1),
          borderRadius: BorderRadius.circular(15),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Marks',
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
              textStyle: TextStyle(fontSize: 10, color: Colors.white)))
    ];
  }
}
