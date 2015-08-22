package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Slime extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		public var minePhase:int = 30;
		public var ore:int = 0;
		
		public var oreText:FlxText;
		
		public function Slime(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			
			oreText = new FlxText(0, 0, 500, "");
			oreText.color = 0xff33333333;
			oreText.size = 16;
			gameStateRef.add(oreText);
		}
		
		override public function update():void {
			oreText.x = x + 15;
			oreText.y = y - 20;
			oreText.text = "" + ore;

			if (ore < gameStateRef.oreMax) {
				if (!inAir) {
					velocity.y = -250; //+ (Math.random() * -800);
					inAir = true;
					acceleration.y = 1750;
					if (2900+48 > x) {
						velocity.x += 50+(Math.random() * 400);
					}
					if (2900+48 < x) {
						velocity.x -= 50+(Math.random() * 400);
					}
				} else {
					if (y >= 896-64) {
						acceleration.y = 0;
						velocity.x /= 5;
						inAir = false;
					}
				}
				if (FlxG.overlap(this, gameStateRef.slimeOreGroup)) {
					minePhase--;
					if (minePhase <= 0 ) {
						//mine an ore
						ore += 2+Math.ceil(Math.random()*5);
						minePhase = 30;
						if (ore >= gameStateRef.oreMax) {
							ore = gameStateRef.oreMax;
							oreText.color = 0xff888888;
						}
					}
				}
			} else {
				if (!inAir) {
				velocity.y = -250; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1750;
				if (2100+64 > x) {
					velocity.x += 50+(Math.random() * 400);
				}
				if (2100+64 < x) {
					velocity.x -= 50+(Math.random() * 400);
				}
				} else {
					if (y >= 896-64) {
						acceleration.y = 0;
						velocity.x /= 5;
						inAir = false;
					}
				}
				if (FlxG.overlap(this, gameStateRef.base)) {
					gameStateRef.jello += ore;
					ore = 0;
					oreText.color = 0xff33333333;
				}
			}
			
			if (y > 896-64)
				y = 896-64;
		}
		
	}

}