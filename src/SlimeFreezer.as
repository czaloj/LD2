package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeFreezer extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		//public var hp:int = EntityStats.FREEZER.health;
		public var stats:EntityStats = EntityStats.FREEZER;
		
		public var referenceStats:EntityStats;
		public var shotCDfinal:int = 150;
		public var shotCD:int;
		private var dt:Number = 0.0;
		
		public function SlimeFreezer(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeFreezer);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			scale = new FlxPoint(2, 2);
			
			//healthbar = new FlxSprite(x, y);
			//gameStateRef.add(healthbar);
		}
		
		override public function update():void {
			shotCD--;
			if (shotCD < 1) {
				shotCD = stats.attackSpeed;
				var newBullet:FreezerBullet = new FreezerBullet(gameStateRef, x, y);
				gameStateRef.add(newBullet);
			}
			
			dt += 1.0 / 30.0;
			dt = dt % 4;
			
			
			var dest:int = gameStateRef.hero.x+300;

			acceleration.y = 0;
			velocity.x = dest > x ? Math.min(EntityStats.FREEZER.moveSpeed, dest - x) : Math.max( -EntityStats.FREEZER.moveSpeed, dest - x);
			acceleration.x = 0;
			
			y = Math.sin(dt * Math.PI / 2) * 50 + 696;
		}		
	}

}