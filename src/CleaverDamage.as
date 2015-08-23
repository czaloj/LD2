package  
{
	import org.flixel.*;
	import game.EntityStats;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class CleaverDamage extends FlxSprite 
	{
		public var timeLeft:int = 30;
		public var gameStateRef:GameState;
		public var dmult:int = 1;
		public var damagedHero:Boolean = false;
		
		public function CleaverDamage(gameStateRefIn:GameState, X:Number=0, Y:Number=0, dmultIn:int=1) 
		{
			super(X, Y);
			makeGraphic(150, 75, 0x00ff0000);
			gameStateRef = gameStateRefIn;
			dmult = dmultIn;
		}
		
		override public function update():void {
			timeLeft--;
			if (timeLeft < 1) {
				kill();
			}
			
			if (FlxG.overlap(this, gameStateRef.hero) && !damagedHero) {
				damagedHero = true;
				var damage:int = game.EntityStats.CLEAVER.attack*dmult;
				gameStateRef.hero.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
			}
		}
		
	}

}