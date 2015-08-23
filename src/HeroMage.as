package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class HeroMage extends FlxSprite 
	{
		private var state:GameState;
		
		public function HeroMage(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.heroMage);
			this.state = state;
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}