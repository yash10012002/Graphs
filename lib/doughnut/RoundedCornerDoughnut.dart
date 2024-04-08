import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class RoundedCornerDoughnut extends StatefulWidget {
  const RoundedCornerDoughnut({super.key});

  @override
  State<RoundedCornerDoughnut> createState() => _RoundedCornerDoughnutState();
}

class _RoundedCornerDoughnutState extends State<RoundedCornerDoughnut> {
  @override
  Widget build(BuildContext context) {
    return _buildRoundedDoughnutChart();
  }

  /// Returns the circular charts with rounded corner doughnut series.
  SfCircularChart _buildRoundedDoughnutChart() {
    return SfCircularChart(
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      title: ChartTitle(text: 'Software development cycle'),
      series: _getRoundedDoughnutSeries(),
    );
  }

  /// Returns rounded corner doughunut series.
  List<DoughnutSeries<ChartSampleData, String>> _getRoundedDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Planning', y: 10),
          ChartSampleData(x: 'Analysis', y: 10),
          ChartSampleData(x: 'Design', y: 10),
          ChartSampleData(x: 'Development', y: 10),
          ChartSampleData(x: 'Testing & Integration', y: 10),
          ChartSampleData(x: 'Maintainance', y: 10)
        ],
        animationDuration: 0,
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '60%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
      ),
    ];
  }
}
