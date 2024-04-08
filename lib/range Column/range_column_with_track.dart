import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class RangeColumnWithTrack extends StatefulWidget {
  const RangeColumnWithTrack({super.key});

  @override
  State<RangeColumnWithTrack> createState() => _RangeColumnWithTrackState();
}

class _RangeColumnWithTrackState extends State<RangeColumnWithTrack> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, canShowMarker: false, header: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRangeColumnwithTrack();
  }

  /// Returns the range column chart with tracker.
  SfCartesianChart _buildRangeColumnwithTrack() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Meeting timings of an employee'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          minimum: 1,
          maximum: 10,
          labelFormat: '{value} PM',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getRangeColumnSerieswithTrack(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render on the
  ///  range column cahrt series with tracker.
  List<RangeColumnSeries<ChartSampleData, String>>
      _getRangeColumnSerieswithTrack() {
    return <RangeColumnSeries<ChartSampleData, String>>[
      RangeColumnSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Day 1', y: 3, yValue: 5),
            ChartSampleData(x: 'Day 2', y: 4, yValue: 7),
            ChartSampleData(x: 'Day 3', y: 4, yValue: 8),
            ChartSampleData(x: 'Day 4', y: 2, yValue: 5),
            ChartSampleData(x: 'Day 5', y: 5, yValue: 7),
          ],

          /// To enable tracker for range column using this property.
          isTrackVisible: true,
          trackColor: const Color.fromRGBO(198, 201, 207, 1),
          borderRadius: BorderRadius.circular(15),
          trackBorderColor: Colors.grey[100]!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          lowValueMapper: (ChartSampleData sales, _) => sales.y,
          highValueMapper: (ChartSampleData sales, _) => sales.yValue,
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.top))
    ];
  }
}
