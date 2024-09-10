import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dnd_event/model/airtable_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'airtable_provider.g.dart';

@Riverpod(keepAlive: true)
class AirtableProvider extends _$AirtableProvider {
  late final Timer timer;

  @override
  AirtableResponse? build() {
    fetch();
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => fetch(),
    );

    ref.onDispose(() => timer.cancel());
    return null;
  }

  Future<void> fetch() async {
    final token = dotenv.get('AIRTABLE_TOKEN');
    final api = dotenv.get('AIRTABLE_API');

    final fetchResult = await Dio().get<Map<String, dynamic>>(
      api,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (fetchResult.data == null) {
      return;
    }

    final fetchParsed = AirtableResponse.fromJson(fetchResult.data!);

    state = fetchParsed;
  }
}
