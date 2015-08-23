package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class SlimeHealer extends FlxSprite 
	{
		private var state:GameState;
		
		public function SlimeHealer(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.slimeHealer);
			this.state = state;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			
		}
	}

}