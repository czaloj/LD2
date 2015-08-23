package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class HeroRanger extends FlxSprite 
	{
		private var state:GameState;
		
		public function HeroRanger(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.heroRanger);
			this.state = state;
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}