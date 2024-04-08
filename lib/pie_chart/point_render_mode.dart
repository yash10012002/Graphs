import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class PiePointRenderMode extends StatefulWidget {
  const PiePointRenderMode({super.key});

  @override
  State<PiePointRenderMode> createState() => _PiePointRenderModeState();
}

class _PiePointRenderModeState extends State<PiePointRenderMode> {
  List<String>? _modeList;
  late String _selectedMode;
  late PointRenderMode _mode;

  @override
  void initState() {
    _modeList = <String>['gradient', 'segment'].toList();
    _selectedMode = 'gradient';
    _mode = PointRenderMode.gradient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGroupingPieChart(),
        buildSettings(context),
      ],
    );
  }

  @override
  Widget buildSettings(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
                height: 60,
                child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Point rendering mode',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 0.07 * screenWidth),
                            width: 0.5 * screenWidth,
                            alignment: Alignment.bottomLeft,
                            child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                underline: Container(
                                    color: const Color(0xFFBDBDBD), height: 1),
                                value: _selectedMode,
                                items: _modeList!.map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: (value != null)
                                          ? value
                                          : 'Render mode',
                                      child: Text(
                                        value,
                                      ));
                                }).toList(),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    onModeTypeChange(value);
                                    stateSetter(() {});
                                  });
                                }),
                          )
                        ],
                      ),
                    ]));
          }),
        ],
      );
    });
  }

  /// Return the circular charts with pie series.
  SfCircularChart _buildGroupingPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Monthly expenditure of an individual'),
      series: _getGroupingPieSeries(),
    );
  }

  @override
  void dispose() {
    _modeList!.clear();
    super.dispose();
  }

  /// Return the pie series which need to be grouping.
  List<PieSeries<ChartSampleData, String>> _getGroupingPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          radius: '58%',
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Food', y: 15, text: 'Food\n15%'),
            ChartSampleData(x: 'Medical', y: 28, text: 'Medical\n28%'),
            ChartSampleData(x: 'Travel', y: 15, text: 'Travel\n15%'),
            ChartSampleData(x: 'Shopping', y: 17, text: 'Shopping\n17%'),
            ChartSampleData(
                x: 'Others',
                y: 25,
                text: 'Others\n25%',
                pointColor: const Color.fromRGBO(198, 201, 207, 1))
          ],
          pointRenderMode: _mode,

          /// To enable and specify the group mode for pie chart.
          groupMode: CircularChartGroupMode.value,
          groupTo: 7,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y)
    ];
  }

  void onModeTypeChange(String item) {
    _selectedMode = item;
    if (_selectedMode == 'segment') {
      _mode = PointRenderMode.segment;
    }
    if (_selectedMode == 'gradient') {
      _mode = PointRenderMode.gradient;
    }
    setState(() {
      /// update the trackball display type changes
    });
  }
}
