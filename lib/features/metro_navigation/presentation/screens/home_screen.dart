import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:metro_ui/features/metro_navigation/domain/entities/trip_result.dart';
import 'package:metro_ui/features/metro_navigation/domain/services/metro_network.dart';
import 'package:metro_ui/features/metro_navigation/domain/services/trip_planner.dart';
import 'package:metro_ui/features/metro_navigation/presentation/widgets/destination_search_field.dart';
import 'package:metro_ui/features/metro_navigation/presentation/widgets/nearest_station_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/metro_line_id.dart';
import '../utils/station_directory.dart';
import '../widgets/direction_banner.dart';
import '../widgets/metro_app_header.dart';
import '../widgets/no_route_message.dart';
import '../widgets/route_timeline.dart';
import '../widgets/station_picker_field.dart';
import '../widgets/swap_stations_button.dart';
import '../widgets/trip_stats_row.dart';
import 'all_stations_screen.dart';

class HomeScreen extends StatefulWidget {
  final MetroNetwork network;
  final TripPlanner planner;

  const HomeScreen({super.key, required this.network, required this.planner});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _start = RxnString();
  final _end = RxnString();
  final Rx<TripResult?> _result = Rx<TripResult?>(null);
  final _searched = false.obs;

  void _swap() {
    final tmp = _start.value;
    _start.value = _end.value;
    _end.value = tmp;
  }

  void _calculate() {
    if (_start.value == null || _end.value == null) return;

    _searched.value = true;
    _result.value = widget.planner.plan(_start.value!, _end.value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cairo Metro'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt_rounded),
            tooltip: 'All stations',
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AllStationsScreen()),
                ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 30),
          children: [
            MetroAppHeader(
              lines: const [
                MetroLineId.line1,
                MetroLineId.line2,
                MetroLineId.line3
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.stroke),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NearestStationLocator(
                        onTap: () {
                          //Radwa Elsayed///////////////////////////////////////////////////////////////////////////////////////////////
                        }
                    ),
                    SizedBox(height: 15,),
                    Obx(() {
                      return StationPickerField(
                        onTap: () {
                          //Nada Yahia/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        },
                        label: 'From station',
                        hint: 'Choose a start station',
                        allStations: StationDirectory.all,
                        selectedStation: _start.value,
                        onSelected: (s) => _start.value = s,
                      );
                    }),
                    SizedBox(height: 15,),
                    SwapStationsButton(onPressed: _swap),
                    Obx(() {
                      return StationPickerField(
                        onTap: () {
                          //Nada Yahia/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        },
                        label: 'To station',
                        hint: 'Choose a destination station',
                        allStations: StationDirectory.all,
                        selectedStation: _end.value,
                        onSelected: (s) => _end.value = s,
                      );
                    }),
                    const SizedBox(height: 14),
                    Obx(() {
                      return ElevatedButton.icon(
                        onPressed: (_start.value != null && _end.value != null) ? _calculate : null,
                        icon: const Icon(Icons.tram_rounded, size: 18),
                        label: const Text('Calculate trip'),
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.stroke),
                ),
                child: Column(
                  children: [
                    DestinationSearchField(
                      onTap: () {
                        //Aya Hany/////////////////////////////////////////////////////////////////////////////////////////////////////
                      },
                    )
                  ],
                ),
              ),
            ),
              Obx(() {
                if (!_searched.value) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: _result.value == null
                        ? const NoRouteMessage()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TripStatsRow(result: _result.value!),
                        DirectionBanner(result: _result.value!),
                        RouteTimeline(result: _result.value!),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
