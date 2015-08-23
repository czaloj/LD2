package  
{
	import org.flixel.*;
	import graphics.SpriteSheet;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class Base extends FlxSprite 
	{
		public var healthbar:FlxSprite;
		public var healthtext:FlxText;
		public var hp:int = 2500;
		public var justHurt = 10;
		public var state:GameState;
		
		public function Base(stateIn:GameState, X:Number=0, Y:Number=0) 
		{
			super(X-50, Y-105, SpriteSheet.slimeKing);
			//makeGraphic(128, 128, 0xff666666);
			state = stateIn;
			
			healthbar = new FlxSprite(x, y);
			state.add(healthbar);
			healthtext = new FlxText(x, y, 150, "" + hp);
			healthtext.alignment = "center";
			healthtext.size = 15;
			//healthtext.color = 0xff000000;
			state.add(healthtext);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (justHurt > 0) {
				justHurt--;
			}
			
			if (FlxG.overlap(this, state.hero) && justHurt == 0) {
				var herodamage:int = Math.ceil(25 + Math.random() * 10);
				var hurtText1:HurtText = new HurtText("base", herodamage, x + 16, y - 16);
				state.add(hurtText1);
				hp -= herodamage;
				justHurt = 45;
			}
			
			if (hp < 1) {
				//death
				state.remove(healthbar);
				state.remove(healthtext);
				kill();
			} else {
				healthtext.text = "" + hp;
				healthtext.x = x+50;
				healthtext.y = y - 48;
				healthbar.x = x + 50;
				healthbar.y = y - 25;
				healthbar.makeGraphic(Math.ceil((hp / 2500) * 150), 10, 0x85ff0000);
			}
		}
		
	}

}