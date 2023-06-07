import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/CoinDetails/controllers/coin_details_controller.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraghDataCandle extends StatelessWidget {
  GraghDataCandle({Key? key}) : super(key: key);
  @override
  // List<ChartSampleData> chartData = [
  // ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    enableSideBySideSeriesPlacement: true,
                    primaryXAxis: DateTimeAxis(

                      title: AxisTitle(
                        text: "Time"
                      )
                    ),

                    backgroundColor: ColorUtil.kWhite,
                    series: <ChartSeries>[
          CandleSeries<ChartSampleData, DateTime>(
            enableTooltip: true,
            enableSolidCandles: true,
            dataSource: Get.find<CoinDetailsController>().candlesData,
            xValueMapper   : (ChartSampleData data, _) => data.x,
            lowValueMapper : (ChartSampleData data, _) => data.low,
            highValueMapper: (ChartSampleData data, _) => data.high,
            openValueMapper: (ChartSampleData data, _) => data.open,
            closeValueMapper:(ChartSampleData data, _) => data.close,
          )
        ]))));
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x, this.open, this.high, this.low, this.close, this.volume});

  final DateTime? x;
  final num? open;
  final num? high;
  final num? low;
  final num? close;
  final num? volume;
}
