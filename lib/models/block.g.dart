// GENERATED CODE - DO NOT MODIFY BY HAND

part of block;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Block> _$blockSerializer = new _$BlockSerializer();

class _$BlockSerializer implements StructuredSerializer<Block> {
  @override
  final Iterable<Type> types = const [Block, _$Block];
  @override
  final String wireName = 'Block';

  @override
  Iterable<Object> serialize(Serializers serializers, Block object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tx_count;
    if (value != null) {
      result
        ..add('tx_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.mediantime;
    if (value != null) {
      result
        ..add('mediantime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.previousblockhash;
    if (value != null) {
      result
        ..add('previousblockhash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nonce;
    if (value != null) {
      result
        ..add('nonce')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.bits;
    if (value != null) {
      result
        ..add('bits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.difficulty;
    if (value != null) {
      result
        ..add('difficulty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Block deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BlockBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tx_count':
          result.tx_count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mediantime':
          result.mediantime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'previousblockhash':
          result.previousblockhash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nonce':
          result.nonce = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bits':
          result.bits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'difficulty':
          result.difficulty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Block extends Block {
  @override
  final String id;
  @override
  final int height;
  @override
  final int version;
  @override
  final int timestamp;
  @override
  final int tx_count;
  @override
  final int size;
  @override
  final int weight;
  @override
  final int mediantime;
  @override
  final String previousblockhash;
  @override
  final int nonce;
  @override
  final int bits;
  @override
  final int difficulty;

  factory _$Block([void Function(BlockBuilder) updates]) =>
      (new BlockBuilder()..update(updates)).build();

  _$Block._(
      {this.id,
      this.height,
      this.version,
      this.timestamp,
      this.tx_count,
      this.size,
      this.weight,
      this.mediantime,
      this.previousblockhash,
      this.nonce,
      this.bits,
      this.difficulty})
      : super._();

  @override
  Block rebuild(void Function(BlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBuilder toBuilder() => new BlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Block &&
        id == other.id &&
        height == other.height &&
        version == other.version &&
        timestamp == other.timestamp &&
        tx_count == other.tx_count &&
        size == other.size &&
        weight == other.weight &&
        mediantime == other.mediantime &&
        previousblockhash == other.previousblockhash &&
        nonce == other.nonce &&
        bits == other.bits &&
        difficulty == other.difficulty;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                height.hashCode),
                                            version.hashCode),
                                        timestamp.hashCode),
                                    tx_count.hashCode),
                                size.hashCode),
                            weight.hashCode),
                        mediantime.hashCode),
                    previousblockhash.hashCode),
                nonce.hashCode),
            bits.hashCode),
        difficulty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Block')
          ..add('id', id)
          ..add('height', height)
          ..add('version', version)
          ..add('timestamp', timestamp)
          ..add('tx_count', tx_count)
          ..add('size', size)
          ..add('weight', weight)
          ..add('mediantime', mediantime)
          ..add('previousblockhash', previousblockhash)
          ..add('nonce', nonce)
          ..add('bits', bits)
          ..add('difficulty', difficulty))
        .toString();
  }
}

class BlockBuilder implements Builder<Block, BlockBuilder> {
  _$Block _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  int _version;
  int get version => _$this._version;
  set version(int version) => _$this._version = version;

  int _timestamp;
  int get timestamp => _$this._timestamp;
  set timestamp(int timestamp) => _$this._timestamp = timestamp;

  int _tx_count;
  int get tx_count => _$this._tx_count;
  set tx_count(int tx_count) => _$this._tx_count = tx_count;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  int _weight;
  int get weight => _$this._weight;
  set weight(int weight) => _$this._weight = weight;

  int _mediantime;
  int get mediantime => _$this._mediantime;
  set mediantime(int mediantime) => _$this._mediantime = mediantime;

  String _previousblockhash;
  String get previousblockhash => _$this._previousblockhash;
  set previousblockhash(String previousblockhash) =>
      _$this._previousblockhash = previousblockhash;

  int _nonce;
  int get nonce => _$this._nonce;
  set nonce(int nonce) => _$this._nonce = nonce;

  int _bits;
  int get bits => _$this._bits;
  set bits(int bits) => _$this._bits = bits;

  int _difficulty;
  int get difficulty => _$this._difficulty;
  set difficulty(int difficulty) => _$this._difficulty = difficulty;

  BlockBuilder();

  BlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _height = $v.height;
      _version = $v.version;
      _timestamp = $v.timestamp;
      _tx_count = $v.tx_count;
      _size = $v.size;
      _weight = $v.weight;
      _mediantime = $v.mediantime;
      _previousblockhash = $v.previousblockhash;
      _nonce = $v.nonce;
      _bits = $v.bits;
      _difficulty = $v.difficulty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Block other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Block;
  }

  @override
  void update(void Function(BlockBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Block build() {
    final _$result = _$v ??
        new _$Block._(
            id: id,
            height: height,
            version: version,
            timestamp: timestamp,
            tx_count: tx_count,
            size: size,
            weight: weight,
            mediantime: mediantime,
            previousblockhash: previousblockhash,
            nonce: nonce,
            bits: bits,
            difficulty: difficulty);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
