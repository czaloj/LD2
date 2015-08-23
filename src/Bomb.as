package  
{
	import org.flixel.*;
	import game.EntityStats;
	import graphics.SpriteSheet;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Bomb extends FlxSprite 
	{
		public var deathTimer:int = 60;
		public var gameStateRef:GameState;
		public var dmult:int = 1;
		
		public function Bomb(gameStateRefIn:GameState, X:Number=0, Y:Number=0, dmultIn:int=1) 
		{
			super(X, Y, SpriteSheet.bomberBomb);
			//makeGraphic(15, 15, 0xffff0000);
			scale = new FlxPoint(2, 2);
			velocity.x = -350;
			velocity.y = -400;
			acceleration.y = 1000;
			gameStateRef = gameStateRefIn;
			dmult = dmultIn;
		}
		
		override public function update():void {
			deathTimer--;
			if (deathTimer < 0 || y > 896) {
				var expl:BombExplosion = new BombExplosion(gameStateRef, x - 100, y - 100, dmult);
				gameStateRef.add(expl);
				createDust();
				kill();
			}
			if (x < 0)
				kill();
				
			if (FlxG.overlap(this, gameStateRef.hero)) {
				createDust();
				kill();
				var damage:int = Math.ceil(game.EntityStats.BOMBER.attack*1.5*dmult);
				gameStateRef.hero.knockback(damage);
				var hurtText2:HurtText = new HurtText("hero", damage, gameStateRef.hero.x + 16, gameStateRef.hero.y - 16);
				gameStateRef.add(hurtText2);
			}
		}
		
		//explosion
		public function createDust():void
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 800;
			emitter.setXSpeed(-800, 800);
			emitter.setYSpeed(-325, -575);
			emitter.bounce = 0.5;
			var particles: int = 13;
			
			var pSize:int = 6;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				//particle.makeGraphic(pSize, pSize, 0xff660000);
				particle.loadGraphic(SpriteSheet.bombShatter);
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