import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String? _start;
  String? _end;
  TripResult? _result;
  bool _searched = false;

  void _swap() {
    setState(() {
      final tmp = _start;
      _start = _end;
      _end = tmp;
    });
  }

  void _calculate() {
    if (_start == null || _end == null) return;
    setState(() {
      _searched = true;
      _result = widget.planner.plan(_start!, _end!);
    });
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
          padding: const EdgeInsets.only(bottom: 32),
          children: [
            MetroAppHeader(
              lines: const [MetroLineId.line1, MetroLineId.line2, MetroLineId.line3],
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
                        onTap: (){
                          //Radwa Elsayed///////////////////////////////////////////////////////////////////////////////////////////////
                        }
                    ),
                    SizedBox(height: 15,),
                    StationPickerField(
                      onTap: (){
                        //Nada Yahia/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      },
                      label: 'From station',
                      hint: 'Choose a start station',
                      allStations: StationDirectory.all,
                      selectedStation: _start,
                      onSelected: (s) => setState(() => _start = s),
                    ),
                    SizedBox(height: 15,),
                    SwapStationsButton(onPressed: _swap),
                    StationPickerField(
                      onTap: (){
                        //Nada Yahia/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      },
                      label: 'To station',
                      hint: 'Choose a destination station',
                      allStations: StationDirectory.all,
                      selectedStation: _end,
                      onSelected: (s) => setState(() => _end = s),
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      onPressed: (_start != null && _end != null) ? _calculate : null,
                      icon: const Icon(Icons.tram_rounded, size: 18),
                      label: const Text('Calculate trip'),
                    ),
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

                      },
                      //Aya Hany/////////////////////////////////////////////////////////////////////////////////////////////////////

                    )
                  ],
                ),
              ),
            ),
            if (_searched)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: _result == null
                      ? const NoRouteMessage()
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TripStatsRow(result: _result!),
                      DirectionBanner(result: _result!),
                      RouteTimeline(result: _result!),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
