package;


#if cpp
typedef U64 = cpp.UInt64;
#elseif cs
import cs.types.UInt64;
typedef U64 = UInt64
#elseif java
import numerix.ULong;

@:forward(longValue)
abstract U64(ULong) from ULong to ULong {
	inline function new(i:Int) {
		this = ULong.valueOf(untyped __java__('(long){0} & 0xFFFFFFFFL', i));
	}


	@:from public static inline function fromInt(i:Int):U64 {
		return ULong.valueOf(untyped __java__('(long){0} & 0xFFFFFFFFL', i));
	}

	@:to public static inline function toULong(i:ULong):ULong {
		return ULong.valueOf(i.longValue());
	}

	@:from public static inline function fromInt64(i:haxe.Int64):U64 {
		return ULong.valueOf(untyped __java__('(long){0} & 0xFFFFFFFFL', i));
	}

	@:to public inline function toInt64():haxe.Int64 {
		return this.longValue();
	}

	@:to public inline function toInt():Int {
		return this.intValue();
	}

	@:to public inline function toDouble() {
		return this.doubleValue();
	}

	@:op(a+b) public function add(b:U64):U64 {
		return this.add(b);
	}

	@:op(a+b) public static inline function addInt2(a:Int, b:U64):U64 {
		return b.add(a);
	}

	@:op(a+b) public function addInt(b:Int):U64 {
		return this.addInt(b);
	}

	@:op(a++) public inline function inc():U64 {
		this = this.add(ULong.valueOf(1));
		return this;
	}


	@:op(a+b) public function addI64(b:I64):U64 {
		return this.addLong(b);
	}
	

	@:op(a-b) public function sub(b:U64):U64 {
		return this.substract(b);
	}

	@:op(a-b) public function subI64(b:I64):U64 {
		return this.subtractI64(b);
	}

	@:op(a-b) public function subI32(b:I32):U64 {
		return this.subtractI32(b);
	}

	@:op(-a) public function neg():U64 {
		return 1 - this.longValue();
	}

	@:op(a/b) public function div(b:U64):U64 {
		return U64.fromInt64(untyped __java__('({0} / {1})', this.longValue(), b.longValue()));
	}


    @:op(a > s) public inline function gt(s:U64) {
		return untyped __java__('({0} > {1})', this.longValue(), s.longValue());
	}

    @:op(a < s) public inline function lt(s:U64) {
		return untyped __java__('({0} < {1})', this.longValue(), s.longValue());
	}

    @:op(a >= s) public inline function gte(s:U64) {
		return untyped __java__('({0} >= {1})', this.longValue(), s.longValue());
	}

    @:op(a <= s) public inline function lte(s:U64) {
		 return untyped __java__('({0} <= {1})', this.longValue(), s.longValue());
	}

	@:op(a * s) public inline function mult(s:U64) {
		return U64.fromInt64(untyped __java__('({0} * {1})', this.longValue(), s.longValue()));
	}



	@:op(a >> s) public inline function shiftRighti(s:Int):U64 {
		return ULong.valueOf(untyped __java__('({0} >> {1}) & 0xFFFFFFFFL', this.longValue(), s));
	}

	@:op(a % s) public inline function mod(s:U64):U64 {
		return ULong.valueOf(untyped __java__('({0} % {1}) & 0xFFFFFFFFL', this.longValue(), s.longValue()));
	}

	@:op(a << s) public inline function shiftLeft(s:Int):U64 {
		return ULong.valueOf(untyped __java__('({0} << {1}) & 0xFFFFFFFFL', this.longValue(), s));
	}

	@:op(a & s) public inline function shiftRight(s:U64):U64 {
		return ULong.valueOf(untyped __java__('({0} & {1}) & 0xFFFFFFFFL', this.longValue(), s.longValue()));
	}

	@:op(a & s) public static inline function ishiftRight(a:Int, s:U64):U64 {
		return ULong.valueOf(untyped __java__('({0} & {1}) & 0xFFFFFFFFL', a, s.longValue()));
	}


}
#elseif js
abstract U64(haxe.Int64) {
	inline function new(i:haxe.Int64) {
		this = i;
	}

	@:from public static inline function fromInt64(i:haxe.Int64):U64 {
		return new U64(i);
	}

	@:from public static inline function fromInt(i:Int):U64 {
		return new U64(haxe.Int64.ofInt(i));
	}

	@:to public inline function toInt64():haxe.Int64 {
		return this;
	}

	@:to public inline function toInt():Int {
		return haxe.Int64.toInt(this);
	}

	@:op(a + b) public function add(b:U64):U64 {
		var b0 = cast(b, haxe.Int64).high;
		var b1 = cast(b, haxe.Int64).low;

		var a0 = this.high;
		var a1 = this.low;

		var u = (a1 + b1) | 0;

		// either two highest bits are on
		// or one highest bit is on and the
		// other number is >= in absolute value
		var c = untyped __js__('+((a1 < 0 && (b1 < 0 || b1 > ~a1)) || (b1 < 0 && b1 > ~a1))');

		var ret:haxe.Int64 = haxe.Int64.make((a0 + b0 + c) | 0, u);

		return ret;
	}

	@:op(a * b) public function and(b:U64):U64 {
		var a0 = this.high;
		var a1 = this.low;
		var b0 = cast(b, haxe.Int64).high;
		var b1 = cast(b, haxe.Int64).low;

		return haxe.Int64.make(a0 & b0, a1 & b1);
	}

	public inline function compare(b:U64):Bool {
		var a0 = this.high;
		var a1 = this.low;
		var b0 = cast(b, haxe.Int64).high;
		var b1 = cast(b, haxe.Int64).low;

		a0 >>>= 0;
		a1 >>>= 0;
		b0 >>>= 0;
		b1 >>>= 0;

		var ret = a0 < b0 ? -1 : a0 > b0 ? 1 : a1 < b1 ? -1 : a1 > b1 ? 1 : 0;

		return ret == 1;
	}

	@:op(~a) public inline function not():U64 {
		return haxe.Int64.make(~this.high, ~this.low);
	}

	public inline function rotateRight(s):U64 {
		var a0 = this.high;
		var a1 = this.low;
		if (s == 0 || s == 64) {
			return haxe.Int64.make(a0, a1);
		} else if (s < 32) {
			return haxe.Int64.make((a1 << (32 - s)) | a0 >>> s, (a0 << (32 - s)) | (a1 >>> s));
		} else if (s == 32) {
			return haxe.Int64.make(a1, a0);
		} else {
			s -= 32;
			return haxe.Int64.make((a0 << (32 - s)) | (a1 >>> s), (a1 << (32 - s)) | a0 >>> s);
		}
	}

	public inline function rotateLeft(s):U64 {
		return rotateRight(64 - s);
	}

	@:op(a << s) public inline function shiftLeft(s:Int):U64 {
		var a0 = this.high;
		var a1 = this.low;

		if (s == 0) {
			return haxe.Int64.make(a0, a1);
		} else if (s < 32) {
			return haxe.Int64.make((a1 >>> (32 - s)) | (a0 << s), a1 << s | 0);
		} else if (s < 64) {
			return haxe.Int64.make(a1 << (s - 32) | 0, 0);
		} else {
			return haxe.Int64.make(a0, a1);
		}
	}

	@:op(a >> s) public inline function shiftRight(s:Int):U64 {
		var a0 = this.high;
		var a1 = this.low;
		if (s == 0) {
			return haxe.Int64.make(a0, a1);
		} else if (s < 32) {
			return haxe.Int64.make(a0 >>> s | 0, (a0 << (32 - s)) | (a1 >>> s));
		} else if (s < 64) {
			return haxe.Int64.make(0, a0 >>> (s - 32) | 0);
		} else {
			return haxe.Int64.make(a0, a1);
		}
	}

    @:op(a ^ b)  public inline function xor(b:U64):U64{
        var a0 = this.high;
		var a1 = this.low;
		var b0 = cast(b, haxe.Int64).high;
		var b1 = cast(b, haxe.Int64).low;

        return haxe.Int64.make(a0 ^ b0, a1 ^ b1);
    }
}
#end
