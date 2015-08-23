package 
{
	import graphics.SpriteSheet;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class HeroMelee extends FlxSprite 
	{
		private var state:GameState;
		public var moveSpeed:Number = 1;
		public var freezecd:int = 0;
		public var knockbackcd:int = 0;
		public var hp:int = 1000;
		
		public var healthbar:FlxSprite;
		public var healthtext:FlxText;
		public var anim:int = 10;
		public var canim:int = 1;
		
		public function HeroMelee(state:GameState, X:Number=0, Y:Number=0) 
		{
			super(X, Y, SpriteSheet.heroMelee);
			this.state = state;
			scale = new FlxPoint(2, 2);
			
			healthbar = new FlxSprite(x, y);
			state.add(healthbar);
			healthtext = new FlxText(x, y, 75, "" + hp);
			healthtext.alignment = "center";
			//healthtext.color = 0xff000000;
			state.add(healthtext);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (hp < 1) {
				//death
				state.remove(healthbar);
				state.remove(healthtext);
				kill();
			} else {
				healthtext.text = "" + hp;
				healthtext.x = x-15;
				healthtext.y = y - 58;
				healthbar.x = x-15;
				healthbar.y = y - 45;
				healthbar.makeGraphic(Math.ceil((hp / 1000) * 75), 6, 0x85ff0000);
			}
			
			if (freezecd > 0) {
				moveSpeed = 30;
				freezecd--;
				loadGraphic(SpriteSheet.heroMelee_frozen);
			} else {
				moveSpeed = 80;
				//loadGraphic(SpriteSheet.heroMelee);
				if (anim > 0) {
				anim --;
				} else {
					anim = 10;
					if (canim == 1) {
						loadGraphic(SpriteSheet.heroMelee2);
						canim = 2;
					} else {
						loadGraphic(SpriteSheet.heroMelee);
						canim = 1;
					}
				}
			}
			
			if (knockbackcd > 0) {
				moveSpeed = -150;
				knockbackcd--;
			}
			
			if (x < 2560) {
				velocity.x = moveSpeed;
			}
			if (x > 2560) {
				velocity.x = -moveSpeed;
			}
			if (x < 0) {
				x = 0;
			}
		}
		
		public function freeze():void {
			freezecd = 40;
		}
		
		public function knockback(amt:int):void {
			knockbackcd = amt/6;
			hp -= amt;
		}
	}

}