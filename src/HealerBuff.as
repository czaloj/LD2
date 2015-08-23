package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HealerBuff extends FlxSprite 
	{
		public var timeLeft:int = 30;
		public var gameStateRef:GameState;
		
		public function HealerBuff(gameStateRefIn:GameState, X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			makeGraphic(200, 200, 0x25ff99cc);
			gameStateRef = gameStateRefIn;
		}
		
		override public function update():void {
			timeLeft--;
			if (timeLeft < 1) {
				gameStateRef.healGroup.remove(this);
				kill();
			}
		}
		
	}

}