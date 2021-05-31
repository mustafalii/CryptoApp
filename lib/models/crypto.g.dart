// GENERATED CODE - DO NOT MODIFY BY HAND

part of crypto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Crypto> _$cryptoSerializer = new _$CryptoSerializer();

class _$CryptoSerializer implements StructuredSerializer<Crypto> {
  @override
  final Iterable<Type> types = const [Crypto, _$Crypto];
  @override
  final String wireName = 'Crypto';

  @override
  Iterable<Object> serialize(Serializers serializers, Crypto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.last_change;
    if (value != null) {
      result
        ..add('last_change')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.last;
    if (value != null) {
      result
        ..add('last')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.open;
    if (value != null) {
      result
        ..add('open')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.volume;
    if (value != null) {
      result
        ..add('volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Crypto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CryptoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'last_change':
          result.last_change = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'open':
          result.open = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volume':
          result.volume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Crypto extends Crypto {
  @override
  final double last_change;
  @override
  final double last;
  @override
  final double open;
  @override
  final String name;
  @override
  final double volume;

  factory _$Crypto([void Function(CryptoBuilder) updates]) =>
      (new CryptoBuilder()..update(updates)).build();

  _$Crypto._({this.last_change, this.last, this.open, this.name, this.volume})
      : super._();

  @override
  Crypto rebuild(void Function(CryptoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CryptoBuilder toBuilder() => new CryptoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Crypto &&
        last_change == other.last_change &&
        last == other.last &&
        open == other.open &&
        name == other.name &&
        volume == other.volume;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, last_change.hashCode), last.hashCode),
                open.hashCode),
            name.hashCode),
        volume.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Crypto')
          ..add('last_change', last_change)
          ..add('last', last)
          ..add('open', open)
          ..add('name', name)
          ..add('volume', volume))
        .toString();
  }
}

class CryptoBuilder implements Builder<Crypto, CryptoBuilder> {
  _$Crypto _$v;

  double _last_change;
  double get last_change => _$this._last_change;
  set last_change(double last_change) => _$this._last_change = last_change;

  double _last;
  double get last => _$this._last;
  set last(double last) => _$this._last = last;

  double _open;
  double get open => _$this._open;
  set open(double open) => _$this._open = open;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _volume;
  double get volume => _$this._volume;
  set volume(double volume) => _$this._volume = volume;

  CryptoBuilder();

  CryptoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _last_change = $v.last_change;
      _last = $v.last;
      _open = $v.open;
      _name = $v.name;
      _volume = $v.volume;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Crypto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Crypto;
  }

  @override
  void update(void Function(CryptoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Crypto build() {
    final _$result = _$v ??
        new _$Crypto._(
            last_change: last_change,
            last: last,
            open: open,
            name: name,
            volume: volume);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
