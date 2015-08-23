package 
{
	import game.EntityStats;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	
	public class Slime extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public var hp:int;
		public var stats:EntityStats;
		public var justHurt:int = 0;
	
		public var aBuff:int = 0;
		public var tBuff:int = 0;
		public var justHealed:int = 0;
		
		
		public function Slime(state:GameState, s:EntityStats, X:Number=0, Y:Number=0, Image:Class=null) 
		{
			super(X, Y, Image);
			scale = new FlxPoint(2, 2);
			
			// Set references
			gameStateRef = state;
			stats = s;
			
			// Starting health
			hp = stats.health;
			
			// Add healthbar
			healthbar = new FlxSprite(x, y);
			gameStateRef.add(healthbar);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		protected function performBuffs():void
		{
			// Buffing code
			if (tBuff > 0) {
				tBuff--;
			} else {
				aBuff = 1;
			}
			if (FlxG.overlap(this, gameStateRef.buffGroup)) {
				aBuff = EntityStats.AUGMENTOR.buffDamage;
				tBuff = 30;
			}
			
			// Healing code
			if (justHealed > 0) {
				justHealed--;
			}
			if (FlxG.overlap(this, gameStateRef.healGroup) && justHealed == 0) {
				hp += EntityStats.HEALER.healAmount;
				gameStateRef.createHeal(x, y+32);
				justHealed = EntityStats.HEALER.healSpeed;
			}
		}
		
		protected function collideGround():void
		{
			if (y > 896-40)
				y = 896-40;
		}
		
		
		protected function damageFromHero(damageHero:Boolean = true):void
		{
			if (FlxG.overlap(this, gameStateRef.hero) && justHurt == 0) {
				velocity.x += 300;
				velocity.y -= 150;
				
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				var hurtText1:HurtText = new HurtText("slime", herodamage, x + 16, y - 16);
				gameStateRef.add(hurtText1);
				hp -= herodamage;
				justHurt = 10;
			
				if (damageHero)
				{
					var damage:int = stats.attack*aBuff;
					var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
					gameStateRef.add(hurtText2);
					gameStateRef.hero.knockback(damage);
				}
			}
			if (FlxG.overlap(this, gameStateRef.arrowGroup) && justHurt == 0) {
				velocity.x += 120;
				velocity.y -= 120;
				
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				var hurtText1:HurtText = new HurtText("slime", herodamage, x + 16, y - 16);
				gameStateRef.add(hurtText1);
				hp -= herodamage;
				justHurt = 10;
			}
			if (FlxG.overlap(this, gameStateRef.archer) && justHurt == 0) {
				velocity.x += 200;
				velocity.y -= 150;
			
				if (damageHero)
				{
					var damage:int = stats.attack*aBuff;
					var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.archer.x + 16, gameStateRef.archer.y - 16);
					gameStateRef.add(hurtText2);
					gameStateRef.archer.knockback(damage);
				}
			}
		}
		
		protected function checkHealth():void
		{
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
		}
		
		protected function jumpToTarget(dest:int):void
		{
			if (!inAir) {
				velocity.y = -150;
				inAir = true;
				acceleration.y = 1000;
				if (dest > x) {
					velocity.x += stats.moveSpeed + (Math.random() * 100);
				}
				if (dest < x) {
					velocity.x -= stats.moveSpeed + (Math.random() * 100);
				}
			} else {
				if (y >= 896-40) {
					acceleration.y = 0;
					velocity.x /= 5;
					inAir = false;
				}
			}
		}
	}

}