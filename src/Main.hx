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
		trace(res);
		var a:U64 = 3;
		var b:U64 = 5;
		var mul:Int = a + b;
		trace(mul);
	}
}