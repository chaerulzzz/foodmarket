import 'dart:convert';
import 'dart:io';

import 'package:foodmarket/models/models.dart';
import 'package:foodmarket/shared/shared.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

String baseUrl = "http://foodmarket-backend.buildwithangga.id/api/";
String baseImageUrl = "http://foodmarket-backend.buildwithangga.id/storage/";
