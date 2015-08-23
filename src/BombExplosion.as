package  
{
	import org.flixel.*;
	import game.EntityStats;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class BombExplosion extends FlxSprite 
	{
		public var timeLeft:int = 30;
		public var gameStateRef:GameState;
		public var dmult:int = 1;
		public var damagedHero:Boolean = false;
		public var damagedArcher:Boolean = false;
		
		public function BombExplosion(gameStateRefIn:GameState, X:Number=0, Y:Number=0, dmultIn:int=1) 
		{
			super(X, Y);
			makeGraphic(200, 200, 0x00ff0000);
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
				var damage:int = game.EntityStats.BOMBER.attack*dmult;
				gameStateRef.hero.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
			}
			
			if (FlxG.overlap(this, gameStateRef.archer) && !damagedArcher) {
				damagedArcher = true;
				var damage:int = game.EntityStats.BOMBER.attack*dmult;
				gameStateRef.archer.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
			}
		}
		
	}

}