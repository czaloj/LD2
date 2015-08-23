package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxSprite;
	
	public class HeroMelee extends FlxSprite 
	{
		private var state:GameState;
		
		public function HeroMelee(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.heroMelee);
			this.state = state;
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}