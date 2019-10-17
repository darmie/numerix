package;

#if cpp
typedef U32 = cpp.UInt32;
#elseif cs 
typedef U32 = UInt;
#elseif (java || js)
abstract U32(I32) {
    inline function new(i:I32) {
        #if java 
        this = untyped __java__('{0} & 0xffffffff', i);
        #elseif js
        this = untyped __js__('{0} >>> 0', i);
        #end   
    }

    @:from public static function fromI32(i:I32):U32 {
       return new U32(i); 
    }

    @:to public inline function toI32():I32 {
        #if java 
        return untyped __java__('(int){0}', this);
        #elseif js
        return untyped __js__('{0} >> 0', this);
        #end
    }

    @:to public inline function toInt():Int {
        #if java 
        return untyped __java__('(int){0}', this);
        #elseif js
        return untyped __js__('{0} >> 0', this);
        #end
    }

    @:op(a >> s) public inline function shiftRight(s:Int):Int {
		return untyped __java__('({0} >> {1}) & 0xFF', this, s);
	}

    @:op(a >>= s) public static inline function shiftRightE(a:U32, s:Int):Int {
		return untyped __java__('{0} >>= {1}', a, s);
	}

    @:op(a * s) public static inline function mul(s:Int, a:U32) {
		return untyped __java__('({0} * {1})', s, a);
	}

    @:op(a > s) public inline function gt(s) {
		return untyped __java__('({0} > {1})', this, s);
	}

    @:op(a < s) public inline function lt(s) {
		return untyped __java__('({0} < {1})', this, s);
	}

    @:op(a >= s) public inline function gte(s) {
		return untyped __java__('({0} >= {1})', this, s);
	}

    @:op(a <= s) public inline function lte(s) {
		return untyped __java__('({0} <= {1})', this, s);
	}

    @:op(a / s) public inline function div(s) {
		return untyped __java__('({0} / {1})', this, s);
	}

    @:op(a % s) public inline function mod(s) {
		return untyped __java__('({0} % {1})', this, s);
	}

    @:op(-a) public inline function neg() {
		return untyped __java__('-{0}', this);
	}

    @:op(a & s) public inline function and(s) {
		return untyped __java__('{0} & {1}', this, s);
	}



    @:op(a > s) public static inline function gti(a:Int, s) {
		return untyped __java__('({0} > {1})', a, s);
	}

    @:op(a < s) public static inline function lti(a:Int, s) {
		return untyped __java__('({0} < {1})', a, s);
	}

    @:op(a >= s) public static inline function gtei(a:Int, s) {
		return untyped __java__('({0} >= {1})', a, s);
	}

    @:op(a <= s) public static inline function ltei(a:Int,s) {
		return untyped __java__('({0} <= {1})', a, s);
	}

    @:op(a / s) public static inline function divi(a:Int,s) {
		return untyped __java__('({0} / {1})', a, s);
	}

    @:op(a % s) public static inline function modi(a:Int,s) {
		return untyped __java__('({0} % {1})', a, s);
	}

    @:op(a & s) public static inline function andi(a:Int,s) {
		return untyped __java__('{0} & {1}', a, s);
	}

    

    #if js
    public static function min():U32{
        return new U32(0x00000000);
    }

    public static function max():U32 {
        return new U32(0xFFFFFFFF);
    }

    @:op(a+b) public inline function add(b:U32):U32 {
        var a:I32 = this;
        var _b:I32 = b;

       return  cast(( a + b ) | 0);
    }

    public inline function rotateLeft(word:I32, shift:Int):U32 {
		return new U32((word << shift) | (word >>> (32 - shift)));
	}

	public inline function rotateRight(word:I32, shift:Int):U32 {
		return new U32((word << (32 - shift)) | (word >>> shift));
	}
    #end
}
#end