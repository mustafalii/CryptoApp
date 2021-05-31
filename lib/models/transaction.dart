library transaction;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crypto_app/models/serializers.dart';

part 'transaction.g.dart';
// json format: 
// [{"hash":"bdbd6859ac5c310fc2e302af6bdd2b758cf45c82495527aedbaee6b3b05defe9","ver":1,"vin_sz":1,
// "vout_sz":1,"size":304,"weight":1216,"fee":8568,"relayed_by":"0.0.0.0","lock_time":0,
// "tx_index":8230856906144981,"double_spend":false,"time":1622415879,"block_index":null,
// "block_height":null,"inputs":[{"sequence":4294967295,"witness":"",
// "script":"00483045022100f8871a4d7489543fbe8d312c506e520ad9330db80e4123c141718ce0cb9b76e9022009502247776e24185fe0783bc98b71bc223ffa567045d47cb4034530fbc5d8f5014830450221008dd7dd82a506ca7eb1501ea60fe39b72d7fc65a2d78535313f4c01d611fa2c07022075800efa514496aa6bf0d9aa72382898dfb59157fd3bb01fe1a97019bebdd23601475221038e11c0618d713d7626ac8e9c0d96603fc4b61ba8e7a3e55543adc87af9880b952103dac67688409144d79a31dbae969ad0f0ab5bbdc028ef3d9789877b3b92db9bad52ae",
// "index":0,"prev_out":{"spent":true,"script":"a914a3ca6ddeaa0eca763fdecc96a0573fa733b5020587","spending_outpoints":[{"tx_index":8230856906144981,"n":0}],"tx_index":5470575808489571,"value":370835,"addr":"3Gd4ZqZQCuZqGbD6DBBXfqVk3AHpWr1uDT","n":1,"type":0}}],"out":[{"type":0,"spent":false,"value":362267,"spending_outpoints":[],"n":0,"tx_index":8230856906144981,"script":"76a914f2231cc260cbd69ff2fbb226aa2c2f09b2cbae3188ac","addr":"1P5Jb58TY2o7aP6o4qLsvDAWVP8w6Wrc6R"}]},

abstract class Transaction implements Built<Transaction, TransactionBuilder> {
  @nullable
  String get hash;

  @nullable
  int get ver;

  @nullable
  int get size;

  @nullable
  int get weight;

  @nullable
  int get fee;

  @nullable
  int get tx_index;

  @nullable
  int get time;

  // @nullable
  // BuiltList<Map<String, String>> get inputs;

  Transaction._();

  factory Transaction([void Function(TransactionBuilder) updates]) =
      _$Transaction;

  String toJson() {
    return json.encode(serializers.serializeWith(Transaction.serializer, this));
  }

  static Transaction fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Transaction.serializer, json);
  }

  static Serializer<Transaction> get serializer => _$transactionSerializer;
}
