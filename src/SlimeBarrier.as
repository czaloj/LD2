package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class SlimeBarrier extends FlxSprite 
	{
		private var state:GameState;
		
		public function SlimeBarrier(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.slimeBarrier);
			this.state = state;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}