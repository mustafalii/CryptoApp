import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:crypto_app/models/block.dart';
import 'package:crypto_app/models/crypto.dart';
import 'package:crypto_app/models/transaction.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor([
  Crypto,
  Block,
  Transaction,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
