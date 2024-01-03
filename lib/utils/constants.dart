// constants.dart

// App name
import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

const String appName = "UAE Gold Price Charts and Table";
const String appTitle = "UAE Gold Price Charts";
const List<String> columns = ["Date","Morning","Evening"];

// Base theme color
const Color accentColor = FlexColor.greenLightPrimary;
const FlexScheme baseColorScheme =  FlexScheme.green;
// Main JSON Location
const String mainJSON="https://www.uaegoldrates.com/uae-gold-rate.json";
// CSV location
const String jsonLocation = "https://www.keralagold.com/mobile/dubai-gold-rate.json"; // Replace with your CSV URL
String csvLocation="https://www.uaegoldrates.com/dubai-gold-rate-dec-23.csv";
// String csvLocation="https://www.keralagold.com/mobile/dubai-gold-rate.csv";

// Ad ID details
const String adUnitId = "your_ad_unit_id_here"; // Replace with your Ad ID
