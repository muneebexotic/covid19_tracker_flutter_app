import 'dart:convert';

import 'package:covid19_tracker_app/Models/WorldStatesModel.dart';
import 'package:covid19_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class StatesServices {

  Future<WorldStatesModel> fetchWorldStateRecords () async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');

    }
  }
}