package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Slime extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public function Slime(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			
		}
		
		override public function update():void {
			
			if (!inAir) {
				velocity.y = -250 + (Math.random() * -800);
				inAir = true;
				acceleration.y = 1750;
				if (gameStateRef.player.x+600 > x) {
					velocity.x += 50+(Math.random() * 400);
				}
				if (gameStateRef.player.x+600 < x) {
					velocity.x -= 50+(Math.random() * 400);
				}
			} else {
				if (y >= 896-64) {
					acceleration.y = 0;
					velocity.x /= 5;
					inAir = false;
				}
			}
			if (y > 896-64)
				y = 896-64;
		}
		
	}

}