package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeBarrier extends Slime 
	{
		public function SlimeBarrier(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.BARRIER, X, Y, SpriteSheet.slimeBarrier);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x;
			jumpToTarget(dest);
			
			damageFromHero(false);
			
			performBuffs();
			collideGround();
		}		
	}

}