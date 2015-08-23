package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class AugmentorBuff extends FlxSprite 
	{
		public var timeLeft:int = 30;
		public var gameStateRef:GameState;
		
		public function AugmentorBuff(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			makeGraphic(200, 200, 0x25ffffff);
			gameStateRef = gameStateRefIn;
		}
		
		override public function update():void {
			timeLeft--;
			if (timeLeft < 1) {
				gameStateRef.buffGroup.remove(this);
				kill();
			}
		}
		
	}

}