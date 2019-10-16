package ;

/**
	@author $author
**/
class Main {
	public static function main() {
		new Main();
	}

	public function new() {
		var i:I32 = 10;
		var i2:U32 = -5;

		// cs.system.BitConverter.ToInt32(cs.system.BitConverter.GetBytes(i2),0);
		
		var res:Int = i * cast i2;
		Sys.println(res);
		var a:U64 = 3;
		var b:U64 = 5;
		var mul:I32 = cast (a << b);
		Sys.println(mul);


		var val:U64 = -2000;
		var uval:U8 = cast val;

		Sys.println(uval);
	}
}