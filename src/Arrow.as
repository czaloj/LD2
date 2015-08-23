package  
{
	import org.flixel.*;
	import graphics.SpriteSheet;
	
	public class Arrow extends FlxSprite 
	{
		public var deathTimer:int = 90;
		public var gameStateRef:GameState;
		public var dmult:int = 1;
		
		public function Arrow(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.arrow);
			scale = new FlxPoint(2, 2);
			velocity.x = 800;
			velocity.y = -400;
			acceleration.y = 400;
			gameStateRef = gameStateRefIn;
		}
		
		override public function update():void {
			angle = Math.atan2(velocity.y, velocity.x) * 180 / Math.PI;
			
			deathTimer--;
			if (deathTimer < 0) {
				kill();
			}
			if (x > 3230)
				kill();
				
			if (FlxG.overlap(this, gameStateRef.base) && gameStateRef.base.justHurt == 0) {
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				var hurtText1:HurtText = new HurtText("base", herodamage, x + 16, y - 16);
				gameStateRef.add(hurtText1);
				gameStateRef.base.hp -= herodamage;
				gameStateRef.base.justHurt = 10;
				kill();
			}
		}
		
	}

}