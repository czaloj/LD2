package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Cloud extends FlxSprite 
	{
		[Embed(source = "images/cloud1.png")]
		public var cloud_Image:Class;
		
		public function Cloud() 
		{
			super(Math.random() * 3200, 200 + (Math.random() * 400), cloud_Image);
			velocity.x = 25 + (Math.random() * 50);
		}
		
		override public function update():void {
			if (x > 3200) {
				x = 0;
			}
		}
	}

}