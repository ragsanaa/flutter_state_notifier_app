import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/models/api_model.dart';
import 'package:flutter_state_notifier/models/notifier.dart';

final postProvider =
    StateNotifierProvider<DataNotifier, List<Post>>((ref) => DataNotifier());
