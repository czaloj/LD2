package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeBomber extends Slime 
	{
		public var shotCDfinal:int = 150;
		public var shotCD:int;
		
		public function SlimeBomber(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.BOMBER, X, Y, SpriteSheet.slimeBomber);
		}
		
		override public function update():void {
			checkHealth();
			
			// Launch bomb
			shotCD--;
			if (shotCD < 1) {
				shotCD = stats.attackSpeed;
				var newBullet:Bomb = new Bomb(gameStateRef, x+8, y+20, aBuff);
				gameStateRef.add(newBullet);
			}
			
			var dest:int = gameStateRef.hero.x+300;
			jumpToTarget(dest);
			
			damageFromHero(false);
			performBuffs();
			collideGround();
		}		
	}

}