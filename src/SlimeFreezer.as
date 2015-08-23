package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class SlimeFreezer extends FlxSprite 
	{
		private var state:GameState;
		
		public function SlimeFreezer(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.slimeFreezer);
			this.state = state;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}