package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeShooter extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public var hp:int = EntityStats.SHOOTER.health;
		public var stats:EntityStats = EntityStats.SHOOTER;
		
		public var referenceStats:EntityStats;
		public var shotCDfinal:int = 50;
		public var shotCD:int;
		public var justHurt:int = 0;
		
		public var aBuff:int = 0;
		public var tBuff:int = 0;
		public var justHealed:int = 0;
		
		public function SlimeShooter(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeShooter);
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
				healthbar.makeGraphic(Math.ceil((hp / stats.health) * 40), 6, 0x85ff0000);
			}
			shotCD--;
			if (shotCD < 1) {
				shotCD = stats.attackSpeed;
				var newBullet:ShooterBullet = new ShooterBullet(gameStateRef, x+8, y+20, aBuff);
				gameStateRef.add(newBullet);
			}
			
			var dest:int = gameStateRef.hero.x+300;
			if (!inAir) {
				velocity.y = -150; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1000;
				if (dest > x) {
					velocity.x += EntityStats.SHOOTER.moveSpeed+(Math.random() * 100);
				}
				if (dest < x) {
					velocity.x -= EntityStats.SHOOTER.moveSpeed+(Math.random() * 100);
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
			
			if (tBuff > 0) {
				tBuff--;
			} else {
				aBuff = 1;
			}
			
			if (justHealed > 0) {
				justHealed--;
			}
			if (FlxG.overlap(this, gameStateRef.healGroup) && justHealed == 0) {
				hp++;
				justHealed = 5;
				gameStateRef.createHeal(x, y+32);
			}
			
			if (FlxG.overlap(this, gameStateRef.buffGroup)) {
				tBuff = 30;
				aBuff = 2;
			}
			
			if (y > 896-40)
				y = 896-40;
		}		
	}

}