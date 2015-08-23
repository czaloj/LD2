package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeCleaver extends Slime 
	{
		public var shotCDfinal:int = 50;
		public var shotCD:int;
		
		public function SlimeCleaver(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.CLEAVER, X, Y, SpriteSheet.slimeCleaver);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x + 75;
			jumpToTarget(dest);
			
			// Launch cleaver
			shotCD--;
			if (shotCD < 1) {
				shotCD = stats.attackSpeed;
				var newBullet:CleaverDamage = new CleaverDamage(gameStateRef, x-150, y, aBuff);
				gameStateRef.add(newBullet);
			}
			
			damageFromHero();
			performBuffs();
			collideGround();
		}		
	}
}