import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Column_chart/cusom_directional_button.dart';
import '../model/chart_sample_data.dart';

class DefaultFunnelChart extends StatefulWidget {
  const DefaultFunnelChart({super.key});

  @override
  State<DefaultFunnelChart> createState() => _DefaultFunnelChartState();
}

class _DefaultFunnelChartState extends State<DefaultFunnelChart> {
  late List<ChartSampleData> datasource;
  late double gapRatio;
  late int neckWidth;
  late int neckHeight;
  late bool explode;

  @override
  void initState() {
    datasource = <ChartSampleData>[
      ChartSampleData(x: 'Purchased ', y: 150),
      ChartSampleData(x: 'Requested price list', y: 300),
      ChartSampleData(x: 'Downloaded trail', y: 600),
      ChartSampleData(x: 'Visit download page', y: 1500),
      ChartSampleData(x: 'Watched demo', y: 2600),
      ChartSampleData(x: 'Website visitors', y: 3000)
    ];
    gapRatio = 0;
    neckWidth = 20;
    neckHeight = 20;
    explode = false;
    super.initState();
  }

  @override
  Widget buildSettings(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '   Gap ratio',
                softWrap: false,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                width: 0.5 * screenWidth,
                padding: EdgeInsets.only(left: 0.03 * screenWidth),
                child: CustomDirectionalButtons(
                  maxValue: 0.5,
                  initialValue: gapRatio,
                  onChanged: (double val) => setState(() {
                    gapRatio = val;
                  }),
                  step: 0.1,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '   Neck height  ',
                softWrap: false,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                width: 0.5 * screenWidth,
                padding: EdgeInsets.only(left: 0.03 * screenWidth),
                child: CustomDirectionalButtons(
                  maxValue: 50,
                  initialValue: neckHeight.toDouble(),
                  onChanged: (double val) => setState(() {
                    neckHeight = val.toInt();
                  }),
                  step: 10,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '   Neck width',
                softWrap: false,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                width: 0.5 * screenWidth,
                padding: EdgeInsets.only(left: 0.03 * screenWidth),
                child: CustomDirectionalButtons(
                  maxValue: 50,
                  initialValue: neckWidth.toDouble(),
                  onChanged: (double val) => setState(() {
                    neckWidth = val.toInt();
                  }),
                  step: 10,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 6.0),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDefaultFunnelChart(),
        buildSettings(context),
      ],
    );
  }

  ///Get the default funnel chart
  SfFunnelChart _buildDefaultFunnelChart() {
    return SfFunnelChart(
      title: const ChartTitle(text: 'Website conversion rate'),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getFunnelSeries(),
    );
  }

  /// This method returns the funnel series and
  /// its correspoding values to chart.
  FunnelSeries<ChartSampleData, String> _getFunnelSeries() {
    gapRatio = gapRatio;
    neckWidth = neckWidth;
    neckHeight = neckHeight;
    explode = explode;
    return FunnelSeries<ChartSampleData, String>(
        dataSource: datasource,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        explode: explode,
        gapRatio: gapRatio,
        neckHeight: '$neckHeight%',
        neckWidth: '$neckWidth%',
        dataLabelSettings: const DataLabelSettings(isVisible: true));
  }
}
