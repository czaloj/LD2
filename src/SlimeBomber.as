package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class SlimeBomber extends FlxSprite 
	{
		private var state:GameState;
		
		public function SlimeBomber(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.slimeBomber);
			this.state = state;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}