package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeHealer extends Slime 
	{
		public var buffTime:int = 0;
		public var buffCap:int = 30;
		
		public function SlimeHealer(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.HEALER, X, Y, SpriteSheet.slimeHealer);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x + 125;
			jumpToTarget(dest);

			damageFromHero(false);

			// Add buffs
			buffTime++;
			if (buffTime > buffCap) {
				var newBuff:HealerBuff = new HealerBuff(gameStateRef, x - 100, y - 100);
				gameStateRef.healGroup.add(newBuff);
				gameStateRef.add(gameStateRef.healGroup);
				buffTime = 0;
			}
			
			performBuffs();
			collideGround();
		}		
	}

}