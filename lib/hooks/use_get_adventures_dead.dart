import 'package:dnd_event/providers/airtable_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool useGetAdventurersDead(WidgetRef ref) {
  final result = ref.watch(airtableProviderProvider);
  final record = result?.records.firstWhere(
    (record) => record.fields.name == 'AdventurersDead',
  );

  return record != null && record.fields.count != 0;
}
