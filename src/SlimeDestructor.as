package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeDestructor extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		
		public var healthbar:FlxSprite;
		
		public var hp:int = EntityStats.DESTRUCTOR.health;
		public var stats:EntityStats = EntityStats.DESTRUCTOR;
		public var justHurt:int = 0;
		
		public var referenceStats:EntityStats;
		
		public var aBuff:int = 0;
		public var tBuff:int = 0;
		public var justHealed:int = 0;
		
		public var exploded:int = 0;
		
		public function SlimeDestructor(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SpriteSheet.slimeDestructor);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			scale = new FlxPoint(2, 2);
			
			healthbar = new FlxSprite(x, y);
			gameStateRef.add(healthbar);
		}
		
		override public function update():void {
			if (exploded == 0) {
				if (hp > stats.health) {
					hp = stats.health;
				}
				if (justHurt > 0) {
					justHurt--;
				}
				
				var dest:int = gameStateRef.hero.x;
				if (!inAir) {
					velocity.y = -150; //+ (Math.random() * -800);
					inAir = true;
					acceleration.y = 1000;
					if (dest > x) {
						velocity.x += EntityStats.DESTRUCTOR.moveSpeed+(Math.random() * 100);
					}
					if (dest < x) {
						velocity.x -= EntityStats.DESTRUCTOR.moveSpeed+(Math.random() * 100);
					}
				} else {
					if (y >= 896-40) {
						acceleration.y = 0;
						velocity.x /= 5;
						inAir = false;
					}
				}
				
				if (FlxG.overlap(this, gameStateRef.hero) && justHurt == 0 && exploded == 0) {
					velocity.x += 300;
					velocity.y -= 150;
					var herodamage:int = Math.ceil(25 + Math.random() * 10);
					var hurtText1:HurtText = new HurtText("slime", herodamage, x + 16, y - 16);
					gameStateRef.add(hurtText1);
					hp -= herodamage;
					var expl:BombExplosion = new BombExplosion(gameStateRef, x - 100, y - 100, aBuff*4);
					gameStateRef.add(expl);
					createDust();
					justHurt = 10;
					exploded = 300;
					y = 896 - 40;
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
					gameStateRef.createHeal(x, y+32);
					justHealed = 5;
				}
				
				if (y > 896-40)
					y = 896 - 40;
					
			} else {
				exploded--;
				velocity.x = 0;
				velocity.y = 0;
				acceleration.x = 0;
				acceleration.y = 0;
				inAir = false;
			}
		}
		
		public function createDust():void
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 800;
			emitter.setXSpeed(-800, 800);
			emitter.setYSpeed(-325, -575);
			emitter.bounce = 0.5;
			var particles: int = 12;
			
			var pSize:int = 10;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(pSize, pSize, 0xffff0000);
				particle.exists = false;
				particle.x += (Math.random() * 16);
				emitter.add(particle);
			}
			emitter.start(true, 0.5);
			gameStateRef.emitterGroup.add(emitter);
			emitter.at(this);
			emitter.y += 16;
			gameStateRef.add(gameStateRef.emitterGroup);
		}
	}

}