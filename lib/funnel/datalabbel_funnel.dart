import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DataLabelFunnel extends StatefulWidget {
  const DataLabelFunnel({super.key});

  @override
  State<DataLabelFunnel> createState() => _DataLabelFunnelState();
}

class _DataLabelFunnelState extends State<DataLabelFunnel> {
  late List<ChartSampleData> datasource;
  List<String>? _labelPosition;
  late ChartDataLabelPosition _selectedLabelPosition;
  late String _selectedPosition;
  List<String>? _labelIntersectActionList;
  late String _labelIntersectAction;
  late LabelIntersectAction _intersectAction;
  late String _selectedOverflowMode;
  late OverflowMode _overflowMode;
  List<String>? _overflowModeList;

  @override
  void initState() {
    datasource = <ChartSampleData>[
      ChartSampleData(x: 'Finals', y: 2),
      ChartSampleData(x: 'Semifinals', y: 4),
      ChartSampleData(x: 'Quarter finals', y: 8),
      ChartSampleData(x: 'League matches', y: 16),
      ChartSampleData(x: 'Participated', y: 32),
      ChartSampleData(x: 'Eligible', y: 36),
      ChartSampleData(x: 'Applicants', y: 40),
    ];
    _selectedLabelPosition = ChartDataLabelPosition.inside;
    _intersectAction = LabelIntersectAction.shift;
    _labelIntersectAction = 'shift';
    _selectedPosition = 'inside';
    _selectedOverflowMode = 'none';
    _overflowMode = OverflowMode.none;
    _overflowModeList = <String>['shift', 'none', 'hide', 'trim'].toList();
    _labelPosition = <String>['inside', 'outside'].toList();
    _labelIntersectActionList = <String>['shift', 'none', 'hide'].toList();

    super.initState();
  }

  @override
  void dispose() {
    _labelPosition!.clear();
    _labelIntersectActionList!.clear();
    _overflowModeList!.clear();
    super.dispose();
  }

  @override
  Widget buildSettings(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dropDownWidth = (0.2) * screenWidth;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 14,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text('Label position',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: dropDownWidth,
                            child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                isExpanded: true,
                                underline: Container(
                                    color: const Color(0xFFBDBDBD), height: 1),
                                value: _selectedPosition,
                                items: _labelPosition!.map((String value) {
                                  return DropdownMenuItem<String>(
                                      value:
                                          (value != null) ? value : 'outside',
                                      child: Text(
                                        value,
                                      ));
                                }).toList(),
                                onChanged: (dynamic value) {
                                  _onLabelPositionChange(value.toString());
                                  stateSetter(() {});
                                }),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Flexible(
                          child: Text('Overflow mode',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 50,
                            width: dropDownWidth,
                            child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                isExpanded: true,
                                underline: Container(
                                    color: const Color(0xFFBDBDBD), height: 1),
                                value: _selectedOverflowMode,
                                items: _selectedPosition != 'inside'
                                    ? null
                                    : _overflowModeList!.map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: (value != null)
                                                ? value
                                                : 'shift',
                                            child: Text(
                                              value,
                                            ));
                                      }).toList(),
                                onChanged: (dynamic value) {
                                  _changeOverflowMode(value.toString());
                                  stateSetter(() {});
                                }),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Flexible(
                          child: Text('Label intersect \naction',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 50,
                            width: dropDownWidth,
                            child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                isExpanded: true,
                                underline: Container(
                                    color: const Color(0xFFBDBDBD), height: 1),
                                value: _labelIntersectAction,
                                items: (_selectedOverflowMode != 'none' &&
                                        _selectedPosition != 'outside')
                                    ? null
                                    : _labelIntersectActionList!
                                        .map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value ?? 'shift',
                                            child: Text(
                                              value,
                                            ));
                                      }).toList(),
                                onChanged: (dynamic value) {
                                  _changeLabelIntersectAction(value.toString());
                                  stateSetter(() {});
                                }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(flex: 3, child: Container()),
            ],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildFunnelSmartLabelChart(), buildSettings(context)],
    );
  }

  ///Get the funnel chart with smart data label
  SfFunnelChart _buildFunnelSmartLabelChart() {
    return SfFunnelChart(
      title: ChartTitle(text: 'Tournament details'),
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      series: _getFunnelSeries(),
    );
  }

  ///Get the funnel series with smart data label
  FunnelSeries<ChartSampleData, String> _getFunnelSeries() {
    return FunnelSeries<ChartSampleData, String>(
        width: '60%',
        dataSource: datasource,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,

        /// To enable the data label for funnel chart.
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: _selectedLabelPosition,
            labelIntersectAction: _intersectAction,
            overflowMode: _overflowMode,
            useSeriesColor: true));
  }

  ///change the data label position
  void _onLabelPositionChange(String item) {
    _selectedPosition = item;
    if (_selectedPosition == 'inside') {
      _selectedLabelPosition = ChartDataLabelPosition.inside;
    } else if (_selectedPosition == 'outside') {
      _selectedLabelPosition = ChartDataLabelPosition.outside;
    }
    setState(() {
      /// update the label position type change
    });
  }

  /// Change the overflow mode
  void _changeOverflowMode(String item) {
    _selectedOverflowMode = item;
    if (_selectedOverflowMode == 'shift') {
      _overflowMode = OverflowMode.shift;
    }
    if (_selectedOverflowMode == 'hide') {
      _overflowMode = OverflowMode.hide;
    }
    if (_selectedOverflowMode == 'none') {
      _overflowMode = OverflowMode.none;
    }
    if (_selectedOverflowMode == 'trim') {
      _overflowMode = OverflowMode.trim;
    }
    setState(() {
      /// update the overflow mode
    });
  }

  ///Change the label intersect action
  void _changeLabelIntersectAction(String item) {
    _labelIntersectAction = item;
    if (_labelIntersectAction == 'shift') {
      _intersectAction = LabelIntersectAction.shift;
    }
    if (_labelIntersectAction == 'hide') {
      _intersectAction = LabelIntersectAction.hide;
    }
    if (_labelIntersectAction == 'none') {
      _intersectAction = LabelIntersectAction.none;
    }
    setState(() {
      /// update the label intersect action
    });
  }
}
