package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeFighter extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public var hp:int = EntityStats.FIGHTER.health;
		public var stats:EntityStats = EntityStats.FIGHTER;
		public var justHurt:int = 0;
		
		public var referenceStats:EntityStats;
		
		public function SlimeFighter(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeFighter);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			scale = new FlxPoint(2, 2);
			
			healthbar = new FlxSprite(x, y);
			gameStateRef.add(healthbar);
		}
		
		override public function update():void {
			if (justHurt > 0) {
				justHurt--;
			}
			if (hp < 1) {
				//death
				gameStateRef.slimeGroup.remove(this);
				gameStateRef.remove(healthbar);
				kill();
			} else {
				healthbar.x = x-5;
				healthbar.y = y-3;
				healthbar.makeGraphic(Math.ceil((hp / 100) * 40), 6, 0x85ff0000);
			}
			
			var dest:int = gameStateRef.hero.x;
			if (!inAir) {
				velocity.y = -150; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1000;
				if (dest > x) {
					velocity.x += EntityStats.FIGHTER.moveSpeed+(Math.random() * 100);
				}
				if (dest < x) {
					velocity.x -= EntityStats.FIGHTER.moveSpeed+(Math.random() * 100);
				}
			} else {
				if (y >= 896-40) {
					acceleration.y = 0;
					velocity.x /= 5;
					inAir = false;
				}
			}
			
			if (FlxG.overlap(this, gameStateRef.hero) && justHurt == 0) {
				velocity.x += 300;
				velocity.y -= 150;
				var damage:int = stats.attack;
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				gameStateRef.hero.knockback(damage);
				var hurtText1:HurtText = new HurtText("slime", herodamage, x + 16, y - 16);
				gameStateRef.add(hurtText1);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
				hp -= herodamage;
				justHurt = 10;
			}
			
			if (y > 896-40)
				y = 896-40;
		}		
	}

}