package  
{
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeFighter extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public function SlimeFighter(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeFighter);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			scale = new FlxPoint(2, 2);
			
			healthbar = new FlxSprite(x, y);
			gameStateRef.add(healthbar);
		}
		
		override public function update():void {
			if (hp < 1) {
				//death
				gameStateRef.slimeGroup.remove(this);
				gameStateRef.remove(healthbar);
				kill();
			} else {
				healthbar.x = x-5;
				healthbar.y = y-3;
				healthbar.makeGraphic(Math.ceil((hp / 100) * 40), 6, 0x85ff0000);
			}
			
			var dest:int = 50;
			if (!inAir) {
				velocity.y = -150; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1000;
				if (dest > x) {
					velocity.x += 50+(Math.random() * 200);
				}
				if (dest < x) {
					velocity.x -= 50+(Math.random() * 200);
				}
			} else {
				if (y >= 896-40) {
					acceleration.y = 0;
					velocity.x /= 5;
					inAir = false;
				}
			}
			
			if (y > 896-40)
				y = 896-40;
		}		
	}

}