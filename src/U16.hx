package;

#if java 
abstract U16(I16) from I16 to I16 {
    inline function new(i:I16) {
        this = cast(i, Int) & 0xFFFF;
    }
}
#elseif cs 
typedef U16 = cs.StdTypes.UInt16;
#elseif cpp 
typedef U16 = cpp.UInt16;
#end