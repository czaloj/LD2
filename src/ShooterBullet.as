package  
{
	import org.flixel.*;
	import game.EntityStats;
	import graphics.SpriteSheet;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class ShooterBullet extends FlxSprite 
	{
		public var deathTimer:int = 120;
		public var gameStateRef:GameState;
		public var dmult:int = 1;
		
		public function ShooterBullet(gameStateRefIn:GameState, X:Number=0, Y:Number=0, dmultIn:int=1) 
		{
			super(X, Y, SpriteSheet.shooterBullet);
			scale = new FlxPoint(2, 2);
			//makeGraphic(15, 15, 0xffcc00ff);
			velocity.x = -400;
			gameStateRef = gameStateRefIn;
			dmult = dmultIn;
		}
		
		override public function update():void {
			deathTimer--;
			if (deathTimer < 0) {
				createDust();
				kill();
			}
			if (x < 0)
				kill();
				
			if (FlxG.overlap(this, gameStateRef.hero)) {
				createDust();
				kill();
				var damage:int = game.EntityStats.SHOOTER.attack*dmult;
				gameStateRef.hero.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
			}
			
			if (FlxG.overlap(this, gameStateRef.archer)) {
				createDust();
				kill();
				var damage:int = game.EntityStats.SHOOTER.attack*dmult;
				gameStateRef.archer.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.archer.x + 16, gameStateRef.archer.y - 16);
				gameStateRef.add(hurtText2);
			}
		}
		
		public function createDust():void
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 800;
			emitter.setXSpeed(-200, 200);
			emitter.setYSpeed(-125, -175);
			emitter.bounce = 0.5;
			var particles: int = 3;
			
			var pSize:int = 6;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(pSize, pSize, 0xffcc00ff);
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