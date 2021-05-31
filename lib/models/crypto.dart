library crypto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crypto_app/models/serializers.dart';

part 'crypto.g.dart';

abstract class Crypto implements Built<Crypto, CryptoBuilder> {
  @nullable
  double get last_change;

  @nullable
  double get last;

  @nullable
  double get open;

  @nullable
  String get name;

  @nullable
  double get volume;

  double percentChange(){
    return (this.last - this.open)/this.open * 100;
  }

  Crypto._();
  factory Crypto([void Function(CryptoBuilder) updates]) = _$Crypto;

  String toJson() {
    return json.encode(serializers.serializeWith(Crypto.serializer, this));
  }

  static Crypto fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Crypto.serializer, json);
  }

  static Serializer<Crypto> get serializer => _$cryptoSerializer;
}