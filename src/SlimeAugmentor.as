package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	public class SlimeAugmentor extends Slime 
	{
		public var buffTime:int = 0;
		public var buffCap:int = 30;
		
		public function SlimeAugmentor(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(gameStateRefIn, EntityStats.AUGMENTOR, X, Y, SpriteSheet.slimeAugmentor);
		}
		
		override public function update():void {
			checkHealth();
			
			var dest:int = gameStateRef.hero.x + 125;
			jumpToTarget(dest);

			damageFromHero();
			
			buffTime++;
			if (buffTime > buffCap) {
				//do buff
				var newBuff:AugmentorBuff = new AugmentorBuff(gameStateRef, x - 100, y - 100);
				gameStateRef.buffGroup.add(newBuff);
				gameStateRef.add(gameStateRef.buffGroup);
				buffTime = 0;
			}
			
			performBuffs();
			collideGround();
		}
	}
}