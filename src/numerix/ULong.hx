package numerix;

import haxe.io.FPHelper;
import haxe.Int64;
import java.math.BigInteger;

class ULong {
    /**
     * Generated UID
     */
    private static var serialVersionUID:I64 = untyped __java__('-6821055240959745390L');

    /**
     * A constant holding the minimum value an <code>unsigned long</code> can
     * have, 0.
     */
    public static var MIN_VALUE:BigInteger  = BigInteger.ZERO;

    /**
     * A constant holding the maximum value an <code>unsigned long</code> can
     * have, 2<sup>64</sup>-1.
     */
    public static var MAX_VALUE:BigInteger  = new BigInteger("18446744073709551615");

    /**
     * A constant holding the maximum value + 1 an <code>signed long</code> can
     * have, 2<sup>63</sup>.
     */
    public static var  MAX_VALUE_LONG:BigInteger   = new BigInteger("9223372036854775808");


    /**
     * A constant holding the minimum value an <code>unsigned long</code> can
     * have as ULong, 0.
     */
    public static var  MIN:ULong = valueOf(MIN_VALUE.longValue());

    /**
     * A constant holding the maximum value + 1 an <code>signed long</code> can
     * have as ULong, 2<sup>63</sup>.
     */
    public static var MAX:ULong   = valueOf(MAX_VALUE);

    /**
     * The value modelling the content of this <code>unsigned long</code>
     */
    private var value:I64;

    private function new(v:I64){
        this.value = v;
    }


    public static  function valueOf(v:Any):ULong {
        return new ULong(cast v);
    }

    public static function compare(x:I64, y:I64) {
        x += untyped __java__('Long.MIN_VALUE');
        y += untyped __java__('Long.MIN_VALUE');
        return (x < y) ? -1 : ((x == y) ? 0 : 1);
    }


    public function  intValue():Int {
        return untyped __java__('(int){0}', this.value);
    }

    public function  longValue():I64 {
        return this.value;
    }

    public function doubleValue() {
        if (value < 0) return untyped __java__('((double) ({0} & Long.MAX_VALUE)) + Long.MAX_VALUE', this.value);
        else return return untyped __java__('{0}', this.value);
    }



    public function equals(obj:Dynamic):Bool {
        if(Std.is(obj, ULong)){
                return value == cast(obj, ULong).value;
        }
        return false;
    }

    public function add(val:ULong) {
        if (value < 0 && val.value < 0) untyped __java__('throw new NumberFormatException()');
        var result = value + val.value;

        if ((value < 0 || val.value < 0) && result >= 0) untyped __java__('throw new NumberFormatException()');

        return valueOf(result);
    }


    public function addInt(val:Int) {
        return addLong(Int64.ofInt(val));
    }

    public function addLong(val:I64) {
        if (val < 0){
            var v = Math.abs(FPHelper.i64ToDouble(val.low, val.high));
            return subtractI64(FPHelper.doubleToI64(v));
        }

        var result = value + val;

        if (value < 0 && result >= 0) untyped __java__('throw new NumberFormatException()');

        return valueOf(result);
    }



    public function substract(v:ULong) {
        if (compare(value, v.value) < 0) untyped __java__('throw new NumberFormatException()');

        var result = value - v.value;

        if (value < 0 && result >= 0)  untyped __java__('throw new NumberFormatException()');

        return valueOf(result);
    }


    public function subtractI32(v:I32) {
        return subtractI64(Int64.ofInt(v));
    }


    public function subtractI64(v:I64) {
        if (v < 0) return addLong(-v);

        if (compare(value, v) < 0){
            untyped __java__('throw new NumberFormatException()');
        }

        var result = value - v;

        if (value < 0 && result >= 0) untyped __java__('throw new NumberFormatException()');

        return valueOf(result);
    }




    
}