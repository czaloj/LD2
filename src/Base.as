package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Base extends FlxSprite 
	{
		
		public function Base(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			makeGraphic(128, 128, 0xff666666);
		}
		
	}

}