package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeOre extends FlxSprite 
	{
		public var amount:int = 5000;
		
		[Embed(source = "images/slimeore.png")]
		public var slimeOre_Image:Class;
		
		public function SlimeOre(X:Number=0, Y:Number=0) 
		{
			super(X, Y, slimeOre_Image);
			//makeGraphic(128, 128, 0xff777777);
		}
	}
}