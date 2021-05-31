library block;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crypto_app/models/serializers.dart';

part 'block.g.dart';

// Json format:
// [{"id":"0000000000000000000976e074a389d14638ad14241338d9b4b0036e5d32bb5c",
// "height":685565,"version":536887300,"timestamp":1622411019,
// "tx_count":2471,"size":1419923,"weight":3993047,
// "merkle_root":"306b83d6ee96e60b4c6b99f6f56d89077eb33e0a96beb2fef0866576d252b78b",
// "previousblockhash":"0000000000000000000778ef382c1697706e34634696ece8d3243eb061e896d9",
// "mediantime":1622406177,"nonce":3325448363,"bits":386752379,"difficulty":21047730572451},

abstract class Block implements Built<Block, BlockBuilder> {
  @nullable
  String get id;

  @nullable
  int get height;

  @nullable
  int get version;

  @nullable
  int get timestamp;

  @nullable
  int get tx_count;

  @nullable
  int get size;

  @nullable
  int get weight;

  @nullable
  int get mediantime;

  @nullable
  String get previousblockhash;

  @nullable
  int get nonce;

  @nullable
  int get bits;

  @nullable
  int get difficulty;

  Block._();
  factory Block([void Function(BlockBuilder) updates]) = _$Block;

  String toJson() {
    return json.encode(serializers.serializeWith(Block.serializer, this));
  }

  static Block fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Block.serializer, json);
  }

  static Serializer<Block> get serializer => _$blockSerializer;
}
