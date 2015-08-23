package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeShooter extends Slime 
	{
		public var shotCDfinal:int = 50;
		public var shotCD:int;
		
		public function SlimeShooter(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.SHOOTER, X, Y, SpriteSheet.slimeShooter);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x+300;
			jumpToTarget(dest);
			
			damageFromHero(false);
			performBuffs();
			collideGround();
		}		
	}

}