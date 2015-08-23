package  
{
	import org.flixel.*;
	import graphics.SpriteSheet;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class FreezerBullet extends FlxSprite 
	{
		public var deathTimer:int = 60;
		public var gameStateRef:GameState;
		
		public function FreezerBullet(gameStateRefIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.freezerBullet);
			scale = new FlxPoint(2, 2);
			//makeGraphic(20, 20, 0xffffffff);
			velocity.x = -400;
			velocity.y = 300;
			gameStateRef = gameStateRefIn;
		}
		
		override public function update():void {
			deathTimer--;
			if (deathTimer < 0) {
				createDust();
				kill();
			}
			if (x < 0 || y > 883) {
				createDust();
				kill();
			}
			if (FlxG.overlap(this, gameStateRef.hero)) {
				createDust();
				kill();
				gameStateRef.hero.freeze();
			}
		}
		
		public function createDust():void
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 800;
			emitter.setXSpeed(-200, 200);
			emitter.setYSpeed(-125, -175);
			emitter.bounce = 0.5;
			var particles: int = 6;
			
			var pSize:int = 10;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(pSize, pSize, 0xff00ccff);
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