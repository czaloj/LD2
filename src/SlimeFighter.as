package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeFighter extends Slime 
	{
		public function SlimeFighter(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.FIGHTER, X, Y, SpriteSheet.slimeFighter);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x;
			jumpToTarget(dest);

			damageFromHero();
			performBuffs();
			collideGround();
		}
	}

}