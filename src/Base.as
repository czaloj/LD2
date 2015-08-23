package  
{
	import org.flixel.FlxSprite;
	import graphics.SpriteSheet;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Base extends FlxSprite 
	{
		
		public function Base(X:Number=0, Y:Number=0) 
		{
			super(X-50, Y-105, SpriteSheet.slimeKing);
			//makeGraphic(128, 128, 0xff666666);
		}
		
	}

}