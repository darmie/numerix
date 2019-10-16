package;

#if cs
typedef U8 = cs.StdTypes.UInt8;
#elseif cpp 
typedef U8 = cpp.UInt8;
#elseif java
abstract U8(I8) from I8 to I8 {
    inline function new(i:I8) {
        this = cast(i, Int) & 0xFF;
    }
}
#end