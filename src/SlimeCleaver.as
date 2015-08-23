package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class SlimeCleaver extends FlxSprite 
	{
		private var state:GameState;
		
		public function SlimeCleaver(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.slimeCleaver);
			this.state = state;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}