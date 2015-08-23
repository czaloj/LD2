package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeOre extends FlxSprite 
	{
		[Embed(source = "images/slimeore.png")]
		public var slimeOre_Image:Class;
		public var gameStateRef:GameState;
		
		public function SlimeOre(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, slimeOre_Image);
			gameStateRef = gameStateRefIn;
			//makeGraphic(128, 128, 0xff777777);
		}
	}
}