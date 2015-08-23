package  
{
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HurtText extends FlxText 
	{
		
		public function HurtText(type:String, amt:int, X:Number, Y:Number) 
		{
			super(X, Y, 500, "" + amt);
			if (type == "hero") {
				color = 0xffffffff;
			} else if (type == "slime") {
				color = 0xff880000;
			} else if (type == "base") {
				color = 0xffff0000;
			}
			size = 18;
			velocity.y = -25;
			velocity.x = -15;
			text = "-" + amt;
		}
		
		override public function update():void {
			if (alpha > 0) {
				alpha -= 0.01;
			} else {
				kill();
			}
		}
		
	}

}