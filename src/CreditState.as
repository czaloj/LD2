package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class CreditState extends FlxState 
	{
		public var counter:int = 0;
		
		[Embed(source = "images/splash.png")]
		public var chaomoonImage:Class;
		
		override public function create():void {
			super.create();
			
			var bg:FlxSprite = new FlxSprite(0, 0);
			bg.makeGraphic(800, 600, 0xffeeeeee);
			add(bg);
			
			var chaomoon:FlxSprite = new FlxSprite(0, 0, chaomoonImage);
			add(chaomoon);
		}
		
		override public function update():void {
			super.update();
			counter++;
			if (counter > 100)
				next();
		}
		
		public function next():void {
			FlxG.switchState(new MenuState());
		}
	}
}