import 'package:flutter/material.dart';
import 'package:graphs/model/chart_sample_data.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieWithVariousRadius extends StatefulWidget {
  const PieWithVariousRadius({super.key});

  @override
  State<PieWithVariousRadius> createState() => _PieWithVariousRadiusState();
}

class _PieWithVariousRadiusState extends State<PieWithVariousRadius> {
  @override
  Widget build(BuildContext context) {
    return _buildRadiusPieChart();
  }

  /// Returns the circular charts with pie series.
  SfCircularChart _buildRadiusPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Various countries population density and area'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: _getRadiusPieSeries(),
      onTooltipRender: (TooltipArgs args) {
        final NumberFormat format = NumberFormat.decimalPattern();
        args.text = args.dataPoints![args.pointIndex!.toInt()].x.toString() +
            ' : ' +
            format.format(args.dataPoints![args.pointIndex!.toInt()].y);
      },
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the pie series.
  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Argentina', y: 505370, text: '45%'),
            ChartSampleData(x: 'Belgium', y: 551500, text: '53.7%'),
            ChartSampleData(x: 'Cuba', y: 312685, text: '59.6%'),
            ChartSampleData(x: 'Dominican Republic', y: 350000, text: '72.5%'),
            ChartSampleData(x: 'Egypt', y: 301000, text: '85.8%'),
            ChartSampleData(x: 'Kazakhstan', y: 300000, text: '90.5%'),
            ChartSampleData(x: 'Somalia', y: 357022, text: '95.6%')
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          startAngle: 100,
          endAngle: 100,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}
