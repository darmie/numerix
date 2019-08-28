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

    @:from public static inline function fromI32(i:I32):U32 {
       return new U32(i); 
    }

    @:to public inline function toI32():I32 {
        #if java 
        return untyped __java__('(int){0}', this);
        #elseif js
        this = untyped __js__('{0} <<< 0', this);
        #end
    }
}
#end