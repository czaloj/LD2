package  
{
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SlimeMiner extends FlxSprite 
	{
		public var gameStateRef:GameState;
		public var inAir:Boolean = false;
		public var minePhase:int = 30;
		public var ore:int = 0;
		
		public var oreText:FlxText;
		
		public function SlimeMiner(gameStateRefIn:GameState, X:Number=0, Y:Number=0)
		{
			super(X, Y, SpriteSheet.slimeMiner);
			//makeGraphic(64, 64, 0x8000cc33);
			gameStateRef = gameStateRefIn;
			
			oreText = new FlxText(0, 0, 64, "");
			oreText.alignment = "center";
			oreText.color = 0xff33333333;
			oreText.size = 16;
			gameStateRef.add(oreText);
			scale = new FlxPoint(2, 2);
		}
		
		override public function update():void {
			oreText.x = x-16;
			oreText.y = y-16;
			oreText.text = "" + ore;

			if (ore < gameStateRef.oreMax) {
				if (!inAir) {
					velocity.y = -150; //+ (Math.random() * -800);
					inAir = true;
					acceleration.y = 1000;
					if (3000+48 > x) {
						velocity.x += 50+(Math.random() * 200);
					}
					if (3000+48 < x) {
						velocity.x -= 50+(Math.random() * 200);
					}
				} else {
					if (y >= 896-40) {
						acceleration.y = 0;
						velocity.x /= 5;
						inAir = false;
					}
				}
				if (FlxG.overlap(this, gameStateRef.slimeOreGroup)) {
					minePhase--;
					if (minePhase <= 0 ) {
						//mine an ore
						ore += 3;
						createDust();
						minePhase = 30;
						if (ore >= gameStateRef.oreMax) {
							ore = gameStateRef.oreMax;
							oreText.color = 0xff888888;
						}
					}
				}
			} else {
				if (!inAir) {
				velocity.y = -150; //+ (Math.random() * -800);
				inAir = true;
				acceleration.y = 1000;
				if (2560+64 > x) {
					velocity.x += 50+(Math.random() * 200);
				}
				if (2560+64 < x) {
					velocity.x -= 50+(Math.random() * 200);
				}
				} else {
					if (y >= 896-40) {
						acceleration.y = 0;
						velocity.x /= 5;
						inAir = false;
					}
				}
				if (FlxG.overlap(this, gameStateRef.base)) {
					gameStateRef.jello += ore;
					ore = 0;
					oreText.color = 0xff33333333;
				}
			}
			
			if (y > 896-40)
				y = 896-40;
		}
		
		public function createDust():void
		{
			var emitter:FlxEmitter = new FlxEmitter();
			emitter.gravity = 800;
			emitter.setXSpeed(-200, 200);
			emitter.setYSpeed(-125, -175);
			emitter.bounce = 0.5;
			var particles: int = 4;
			
			var pSize:int = 10;
			for(var i: int = 0; i < particles; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(pSize, pSize, 0x80888888);
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