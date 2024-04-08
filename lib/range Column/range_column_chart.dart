import 'package:flutter/material.dart';
import 'package:graphs/range%20Column/default_range_column.dart';
import 'package:graphs/range%20Column/range_column_with_track.dart';
import 'package:graphs/range%20Column/transposed_range_column.dart';

class RangeColumnChart extends StatelessWidget {
  const RangeColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Range Column Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Range Column Chart",
                  ),
                  Tab(
                    text: "Transposed range column",
                  ),
                  Tab(
                    text: "Range column with track",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultRangeColumn(),
                TransposedRangeColumn(),
                RangeColumnWithTrack()
              ],
            ),
          ),
        ));
  }
}
