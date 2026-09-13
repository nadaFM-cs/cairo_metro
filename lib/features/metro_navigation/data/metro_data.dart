import '../domain/entities/metro_line_id.dart';
import '../domain/entities/metro_route.dart';

class MetroData {
  MetroData._();

  static const List<String> line1Stations=[
    'Helwan',
    'Ain Helwan',
    'Helwan University',
    'Wadi Hof',
    'Hadayek Helwan',
    'El Maasara',
    'Tora El Asmant',
    'Kozzika',
    'Tora El Balad',
    'Sakanat El Maadi',
    'Maadi',
    'Hadayek El Maadi',
    'Dar El Salam',
    'El Zahraa',
    'Mar Girgis',
    'El Malek El Saleh',
    'Al Sayeda Zeinab',
    'Saad Zaghloul',
    'Sadat',
    'Nasser',
    'Orabi',
    'Al Shohadaa',
    'Ghamra',
    'El Demerdash',
    'Manshiet El Sadr',
    'Kobri El Qobba',
    'Hammamat El Qobba',
    'Saray El Qobba',
    'Hadayeq El Zaitoun',
    'Helmeyet El Zaitoun',
    'El Matareyya',
    'Ain Shams',
    'Ezbet El Nakhl',
    'El Marg',
    'New El Marg',
  ];
  static const List<String> line2Stations = [
    'El Mounib',
    'Sakiat Mekky',
    'Omm El Masryeen',
    'Giza',
    'Faisal',
    'Cairo University',
    'El Bohoth',
    'Dokki',
    'Opera',
    'Sadat',
    'Mohamed Naguib',
    'Attaba',
    'Al Shohadaa',
    'Masarra',
    'Rod El Farag',
    'St. Teresa',
    'El Khalafawy',
    'El Mezallat',
    'Kolleyyet El Zeraa',
    'Shubra El Kheima',
  ];
  static const List<String> _line3Trunk = [
    'Adly Mansour',
    'El Haykestep',
    'Omar Ibn El Khattab',
    'Qobaa',
    'Hesham Barakat',
    'El Nozha',
    'Nadi El Shams',
    'Alf Maskan',
    'Heliopolis Square',
    'Haroun',
    'Al Ahram',
    'Koleyet El Banat',
    'Stadium',
    'Fair Zone',
    'Abbassia',
    'Abdou Pasha',
    'El Geish',
    'Bab El Shaaria',
    'Attaba',
    'Nasser',
    'Maspero',
    'Safaa Hegazy',
    'Kit Kat',
  ];
  static const List<String> _line3BranchRodElFarag = [
    'Sudan',
    'Imbaba',
    'El Bohy',
    'El Qawmia',
    'Ring Road',
    'Rod El Farag Corridor',
  ];
  static const List<String> _line3BranchCairoUniversity = [
    'Tawfikia',
    'Wadi El Nile',
    'Gamat El Dowal',
    'Boulak El Dakrour',
    'Cairo University',
  ];
  static List<String> get line3TrunkStations => List.unmodifiable(_line3Trunk);
  static List<String> get line3BranchRodElFaragStations => List.unmodifiable(_line3BranchRodElFarag);
  static List<String> get line3BranchCairoUniversityStations => List.unmodifiable(_line3BranchCairoUniversity);

  static List<String> get line3RodElFaragRoute => [..._line3Trunk, ..._line3BranchRodElFarag];
  static List<String> get line3CairoUniversityRoute => [..._line3Trunk, ..._line3BranchCairoUniversity];

  static List<MetroRoute> buildAllRoutes(){
    return [
      MetroRoute(
        id: 'line1',
        lineId: MetroLineId.line1,
        orderedStations: line1Stations,
      ),
      MetroRoute(
        id: 'line2',
        lineId: MetroLineId.line2,
        orderedStations: line2Stations,
      ),
      MetroRoute(
        id: 'line3_rod_el_farag',
        lineId: MetroLineId.line3,
        orderedStations: line3RodElFaragRoute,
      ),
      MetroRoute(
        id: 'line3_cairo_university',
        lineId: MetroLineId.line3,
        orderedStations: line3CairoUniversityRoute,
      ),
    ];
  }
}