import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Column_chart/cusom_directional_button.dart';
import '../model/chart_sample_data.dart';

class DefaultPyramid extends StatefulWidget {
  const DefaultPyramid({super.key});

  @override
  State<DefaultPyramid> createState() => _DefaultPyramidState();
}

class _DefaultPyramidState extends State<DefaultPyramid> {
  late List<ChartSampleData> dataSource;
  List<String>? _pyramidMode;
  late PyramidMode _selectedPyramidMode;
  late String _selectedMode;
  late double gapRatio;
  late bool explode;

  @override
  void initState() {
    dataSource = <ChartSampleData>[
      ChartSampleData(x: 'Walnuts', y: 654),
      ChartSampleData(x: 'Almonds', y: 575),
      ChartSampleData(x: 'Soybeans', y: 446),
      ChartSampleData(x: 'Black beans', y: 341),
      ChartSampleData(x: 'Mushrooms', y: 296),
      ChartSampleData(x: 'Avacado', y: 160),
    ];
    _selectedPyramidMode = PyramidMode.linear;
    _selectedMode = 'linear';
    gapRatio = 0;
    explode = false;
    _pyramidMode = <String>['linear', 'surface'].toList();
    super.initState();
  }

  @override
  void dispose() {
    _pyramidMode!.clear();
    super.dispose();
  }

  @override
  Widget buildSettings(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dropDownWidth = 0.7 * screenWidth;
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
                          child: Text('Pyramid mode',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          child: DropdownButton<String>(
                              focusColor: Colors.transparent,
                              isExpanded: true,
                              underline: Container(
                                  color: const Color(0xFFBDBDBD), height: 1),
                              value: _selectedMode,
                              items: _pyramidMode!.map((String value) {
                                return DropdownMenuItem<String>(
                                    value: (value != null) ? value : 'linear',
                                    child: Text(
                                      value,
                                    ));
                              }).toList(),
                              onChanged: (dynamic value) {
                                _onPyramidModeChange(value.toString());
                                stateSetter(() {});
                              }),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Text('Gap ratio',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          flex: 4,
                          child: CustomDirectionalButtons(
                            maxValue: 0.5,
                            initialValue: gapRatio,
                            onChanged: (double val) => setState(() {
                              gapRatio = val;
                            }),
                            step: 0.1,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text('Explode',
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Flexible(
                          child: Container(
                              padding:
                                  EdgeInsets.only(right: 0.29 * screenWidth),
                              width: dropDownWidth,
                              child: Checkbox(
                                  activeColor: Colors.blueAccent,
                                  value: explode,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      explode = value!;
                                      stateSetter(() {});
                                    });
                                  })),
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
      children: [
        buildSettings(context),
        _buildDefaultPyramidChart(),
      ],
    );
  }

  ///Get the default pyramid chart
  SfPyramidChart _buildDefaultPyramidChart() {
    return SfPyramidChart(
      title: ChartTitle(text: 'Comparison of calories'),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getPyramidSeries(),
    );
  }

  ///Get the default pyramid series
  PyramidSeries<ChartSampleData, String> _getPyramidSeries() {
    return PyramidSeries<ChartSampleData, String>(
        dataSource: dataSource,
        height: '90%',
        explode: explode,
        gapRatio: gapRatio,
        pyramidMode: _selectedPyramidMode,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ));
  }

  /// Change the pyramid mode
  void _onPyramidModeChange(String item) {
    _selectedMode = item;
    if (_selectedMode == 'linear') {
      _selectedPyramidMode = PyramidMode.linear;
    } else if (_selectedMode == 'surface') {
      _selectedPyramidMode = PyramidMode.surface;
    }
    setState(() {
      /// update the pyramid mode changes
    });
  }
}
