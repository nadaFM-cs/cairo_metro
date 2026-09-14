import '../domain/entities/models/metro_station.dart';

class MetroStationData {
  MetroStationData._();

  static const List<MetroStation> stations = [
    // --- Line 1 ---
    MetroStation(name: 'Helwan', latitude: 29.8412, longitude: 31.3005),
    MetroStation(name: 'Ain Helwan', latitude: 29.8601, longitude: 31.3060),
    MetroStation(
      name: 'Helwan University',
      latitude: 29.8687,
      longitude: 31.3142,
    ),
    MetroStation(name: 'Wadi Hof', latitude: 29.8805, longitude: 31.3134),
    MetroStation(name: 'Hadayek Helwan', latitude: 29.8973, longitude: 31.3079),
    MetroStation(name: 'El Maasara', latitude: 29.9074, longitude: 31.3040),
    MetroStation(name: 'Tora El Asmant', latitude: 29.9279, longitude: 31.2941),
    MetroStation(name: 'Kozzika', latitude: 29.9366, longitude: 31.2882),
    MetroStation(name: 'Tora El Balad', latitude: 29.9482, longitude: 31.2785),
    MetroStation(
      name: 'Sakanat El Maadi',
      latitude: 29.9547,
      longitude: 31.2657,
    ),
    MetroStation(name: 'Maadi', latitude: 29.9583, longitude: 31.2582),
    MetroStation(
      name: 'Hadayek El Maadi',
      latitude: 29.9708,
      longitude: 31.2486,
    ),
    MetroStation(name: 'Dar El Salam', latitude: 29.9824, longitude: 31.2404),
    MetroStation(name: 'El Zahraa', latitude: 29.9958, longitude: 31.2330),
    MetroStation(name: 'Mar Girgis', latitude: 30.0059, longitude: 31.2299),
    MetroStation(
      name: 'El Malek El Saleh',
      latitude: 30.0163,
      longitude: 31.2290,
    ),
    MetroStation(
      name: 'Al Sayeda Zeinab',
      latitude: 30.0298,
      longitude: 31.2361,
    ),
    MetroStation(name: 'Saad Zaghloul', latitude: 30.0371, longitude: 31.2378),
    MetroStation(name: 'Sadat', latitude: 30.0444, longitude: 31.2357),
    MetroStation(name: 'Nasser', latitude: 30.0531, longitude: 31.2396),
    MetroStation(name: 'Orabi', latitude: 30.0574, longitude: 31.2435),
    MetroStation(name: 'Al Shohadaa', latitude: 30.0614, longitude: 31.2467),
    MetroStation(name: 'Ghamra', latitude: 30.0687, longitude: 31.2644),
    MetroStation(name: 'El Demerdash', latitude: 30.0772, longitude: 31.2778),
    MetroStation(
      name: 'Manshiet El Sadr',
      latitude: 30.0818,
      longitude: 31.2847,
    ),
    MetroStation(name: 'Kobri El Qobba', latitude: 30.0872, longitude: 31.2926),
    MetroStation(
      name: 'Hammamat El Qobba',
      latitude: 30.0917,
      longitude: 31.2985,
    ),
    MetroStation(name: 'Saray El Qobba', latitude: 30.0984, longitude: 31.3045),
    MetroStation(
      name: 'Hadayeq El Zaitoun',
      latitude: 30.1064,
      longitude: 31.3117,
    ),
    MetroStation(
      name: 'Helmeyet El Zaitoun',
      latitude: 30.1147,
      longitude: 31.3168,
    ),
    MetroStation(name: 'El Matareyya', latitude: 30.1213, longitude: 31.3134),
    MetroStation(name: 'Ain Shams', latitude: 30.1311, longitude: 31.3179),
    MetroStation(name: 'Ezbet El Nakhl', latitude: 30.1408, longitude: 31.3255),
    MetroStation(name: 'El Marg', latitude: 30.1518, longitude: 31.3353),
    MetroStation(name: 'New El Marg', latitude: 30.1631, longitude: 31.3418),

    // --- Line 2  ---
    MetroStation(name: 'El Mounib', latitude: 29.9810, longitude: 31.2125),
    MetroStation(name: 'Sakiat Mekky', latitude: 29.9957, longitude: 31.2089),
    MetroStation(
      name: 'Omm El Masryeen',
      latitude: 30.0055,
      longitude: 31.2079,
    ),
    MetroStation(name: 'Giza', latitude: 30.0106, longitude: 31.2069),
    MetroStation(name: 'Faisal', latitude: 30.0175, longitude: 31.2036),
    MetroStation(
      name: 'Cairo University',
      latitude: 30.0259,
      longitude: 31.2014,
    ),
    MetroStation(name: 'El Bohoth', latitude: 30.0358, longitude: 31.2001),
    MetroStation(name: 'Dokki', latitude: 30.0384, longitude: 31.2117),
    MetroStation(name: 'Opera', latitude: 30.0422, longitude: 31.2256),
    // Sadat (موجودة سابقاً كإحداثي، ولكن تم التكرار لربط القائمة)
    MetroStation(name: 'Mohamed Naguib', latitude: 30.0454, longitude: 31.2443),
    MetroStation(name: 'Attaba', latitude: 30.0526, longitude: 31.2472),
    // Al Shohadaa (موجودة سابقاً)
    MetroStation(name: 'Masarra', latitude: 30.0711, longitude: 31.2447),
    MetroStation(name: 'Rod El Farag', latitude: 30.0807, longitude: 31.2458),
    MetroStation(name: 'St. Teresa', latitude: 30.0883, longitude: 31.2464),
    MetroStation(name: 'El Khalafawy', latitude: 30.0975, longitude: 31.2461),
    MetroStation(name: 'El Mezallat', latitude: 30.1060, longitude: 31.2472),
    MetroStation(
      name: 'Kolleyyet El Zeraa',
      latitude: 30.1136,
      longitude: 31.2497,
    ),
    MetroStation(
      name: 'Shubra El Kheima',
      latitude: 30.1226,
      longitude: 31.2448,
    ),

    // --- Line 3: Trunk (الخط الثالث الرئيسي) ---
    MetroStation(name: 'Adly Mansour', latitude: 30.1472, longitude: 31.4208),
    MetroStation(name: 'El Haykestep', latitude: 30.1436, longitude: 31.4018),
    MetroStation(
      name: 'Omar Ibn El Khattab',
      latitude: 30.1408,
      longitude: 31.3853,
    ),
    MetroStation(name: 'Qobaa', latitude: 30.1368, longitude: 31.3718),
    MetroStation(name: 'Hesham Barakat', latitude: 30.1317, longitude: 31.3601),
    MetroStation(name: 'El Nozha', latitude: 30.1264, longitude: 31.3490),
    MetroStation(name: 'Nadi El Shams', latitude: 30.1206, longitude: 31.3406),
    MetroStation(name: 'Alf Maskan', latitude: 30.1177, longitude: 31.3323),
    MetroStation(
      name: 'Heliopolis Square',
      latitude: 30.1084,
      longitude: 31.3283,
    ),
    MetroStation(name: 'Haroun', latitude: 30.1011, longitude: 31.3276),
    MetroStation(name: 'Al Ahram', latitude: 30.0919, longitude: 31.3242),
    MetroStation(
      name: 'Koleyet El Banat',
      latitude: 30.0808,
      longitude: 31.3298,
    ),
    MetroStation(name: 'Stadium', latitude: 30.0732, longitude: 31.3197),
    MetroStation(name: 'Fair Zone', latitude: 30.0734, longitude: 31.3015),
    MetroStation(name: 'Abbassia', latitude: 30.0684, longitude: 31.2818),
    MetroStation(name: 'Abdou Pasha', latitude: 30.0632, longitude: 31.2721),
    MetroStation(name: 'El Geish', latitude: 30.0617, longitude: 31.2662),
    MetroStation(name: 'Bab El Shaaria', latitude: 30.0543, longitude: 31.2587),
    // Attaba (موجودة بالخط 2)
    // Nasser (موجودة بالخط 1)
    MetroStation(name: 'Maspero', latitude: 30.0552, longitude: 31.2319),
    MetroStation(name: 'Safaa Hegazy', latitude: 30.0618, longitude: 31.2217),
    MetroStation(name: 'Kit Kat', latitude: 30.0644, longitude: 31.2136),

    // --- Line 3: Branch Rod El Farag (تفريعة محور روض الفرج) ---
    MetroStation(name: 'Sudan', latitude: 30.0689, longitude: 31.2052),
    MetroStation(name: 'Imbaba', latitude: 30.0747, longitude: 31.2064),
    MetroStation(name: 'El Bohy', latitude: 30.0829, longitude: 31.2069),
    MetroStation(name: 'El Qawmia', latitude: 30.0924, longitude: 31.2064),
    MetroStation(name: 'Ring Road', latitude: 30.0999, longitude: 31.2001),
    MetroStation(
      name: 'Rod El Farag Corridor',
      latitude: 30.1032,
      longitude: 31.1818,
    ),

    // --- Line 3: Branch Cairo University (تفريعة جامعة القاهرة) ---
    MetroStation(name: 'Tawfikia', latitude: 30.0583, longitude: 31.2019),
    MetroStation(name: 'Wadi El Nile', latitude: 30.0538, longitude: 31.1982),
    MetroStation(name: 'Gamat El Dowal', latitude: 30.0469, longitude: 31.1994),
    MetroStation(
      name: 'Boulak El Dakrour',
      latitude: 30.0361,
      longitude: 31.1932,
    ),
    // Cairo University (موجودة بالخط 2)
  ];
}
