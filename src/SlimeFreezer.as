package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeFreezer extends Slime 
	{
		public var shotCDfinal:int = 150;
		public var shotCD:int;
		private var dt:Number = 0.0;
		
		public function SlimeFreezer(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.FREEZER, X, Y, SpriteSheet.slimeFreezer);
			
			acceleration.x = 0;
			acceleration.y = 0;
		}
		
		override public function update():void {
			// Launch shot
			shotCD--;
			if (shotCD < 1) {
				shotCD = stats.attackSpeed;
				var newBullet:FreezerBullet = new FreezerBullet(gameStateRef, x, y);
				gameStateRef.add(newBullet);
			}

			// Special movement code
			var dest:int = gameStateRef.hero.x+300;
			dt += 1.0 / 30.0;
			dt = dt % 4;
			velocity.x = dest > x ? Math.min(EntityStats.FREEZER.moveSpeed, dest - x) : Math.max( -EntityStats.FREEZER.moveSpeed, dest - x);
			y = Math.sin(dt * Math.PI / 2) * 50 + 696;
		}		
	}

}