import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class BarWithTrack extends StatefulWidget {
  const BarWithTrack({super.key});

  @override
  State<BarWithTrack> createState() => _BarWithTrackState();
}

class _BarWithTrackState extends State<BarWithTrack> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTrackerBarChart();
  }

  /// Returns the bar chart with trackers.
  SfCartesianChart _buildTrackerBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Working hours of employees'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          title: AxisTitle(text: 'Hours'),
          minimum: 0,
          maximum: 8,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getTrackerBarSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the lsit of chart series
  /// which need to render on the bar chart with trackers.
  List<BarSeries<ChartSampleData, String>> _getTrackerBarSeries() {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Mike', y: 7.5),
          ChartSampleData(x: 'Chris', y: 7),
          ChartSampleData(x: 'Helana', y: 6),
          ChartSampleData(x: 'Tom', y: 5),
          ChartSampleData(x: 'Federer', y: 7),
          ChartSampleData(x: 'Hussain', y: 7),
        ],
        borderRadius: BorderRadius.circular(15),
        trackColor: const Color.fromRGBO(198, 201, 207, 1),

        /// If we enable this property as true,
        /// then we can show the track of series.
        isTrackVisible: true,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}
