package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeHealer extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public var hp:int = EntityStats.HEALER.health;
		public var stats:EntityStats = EntityStats.HEALER;
		public var justHurt:int = 0;
		
		public var referenceStats:EntityStats;
		
		public var buffTime:int = 0;
		public var buffCap:int = 30;
		public var aBuff:int = 0;
		public var tBuff:int = 0;
		public var justHealed:int = 0;
		
		public function SlimeHealer(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeHealer);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			scale = new FlxPoint(2, 2);
			
			healthbar = new FlxSprite(x, y);
			gameStateRef.add(healthbar);
		}
		
		override public function update():void {
			if (hp > stats.health) {
				hp = stats.health;
			}
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
				healthbar.makeGraphic(Math.ceil((hp / stats.health) * 40), 6, 0x85ff0000);
			}
			
			var dest:int = gameStateRef.hero.x + 125;
			if (!inAir) {
				velocity.y = -150; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1000;
				if (dest > x) {
					velocity.x += EntityStats.HEALER.moveSpeed+(Math.random() * 75);
				}
				if (dest < x) {
					velocity.x -= EntityStats.HEALER.moveSpeed+(Math.random() * 75);
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
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				var hurtText1:HurtText = new HurtText("slime", herodamage, x + 16, y - 16);
				gameStateRef.add(hurtText1);
				hp -= herodamage;
				justHurt = 10;
			}
			
			buffTime++;
			if (buffTime > buffCap) {
				//do buff
				var newBuff:HealerBuff = new HealerBuff(gameStateRef, x - 100, y - 100);
				gameStateRef.healGroup.add(newBuff);
				gameStateRef.add(gameStateRef.healGroup);
				buffTime = 0;
			}
			
			if (tBuff > 0) {
				tBuff--;
			} else {
				aBuff = 1;
			}
			
			if (FlxG.overlap(this, gameStateRef.buffGroup)) {
				aBuff = 2;
				tBuff = 30;
			}
			if (justHealed > 0) {
				justHealed--;
			}
			if (FlxG.overlap(this, gameStateRef.healGroup) && justHealed == 0) {
				hp++;
				justHealed = 5;
				gameStateRef.createHeal(x, y+32);
			}
			
			if (y > 896-40)
				y = 896-40;
		}		
	}

}