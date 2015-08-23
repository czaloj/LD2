package  
{
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HotBarSlot extends FlxSprite 
	{
		private static const SPAWN_TYPE_FIGHTER:int = 1;
		private static const SPAWN_TYPE_SHOOTER:int = 2;
		private static const SPAWN_TYPE_CLEAVER:int = 3;
		private static const SPAWN_TYPE_BOMBER:int = 4;
		private static const SPAWN_TYPE_BARRIER:int = 5;
		private static const SPAWN_TYPE_DESTRUCTOR:int = 6;
		private static const SPAWN_TYPE_HEALER:int = 7;
		private static const SPAWN_TYPE_AUGMENTOR:int = 8;
		private static const SPAWN_TYPE_FREEZER:int = 9;
		private static const SPAWN_TYPE_MINER:int = 10;
		
		
		[Embed(source = "images/hb_slot.png")]
		public var hb_slot_Image:Class;
		[Embed(source = "images/hb_slot_cd.png")]
		public var hb_slotcd_Image:Class;
		
		public var hbRef:HotBar;
		public var spawnType:int;
		public var cd:int = 0;
		
		public var cdtext:FlxText;
		public var textadded:Boolean = false;
		
		public function HotBarSlot(skillIn:int, hbRefIn:HotBar, X:Number=0) 
		{
			super(X, 620, hb_slot_Image);
			hbRef = hbRefIn;
			spawnType = skillIn;
			cdtext = new FlxText(x + 30, y + 24, 500, "");
			cdtext.visible = false;
			cdtext.size = 18;
			cdtext.scrollFactor.x = cdtext.scrollFactor.y = 0;
			scrollFactor.x = scrollFactor.y = 0;
		}
		
		override public function update():void {
			if (!textadded) {
				addthing();
				hbRef.gameStateRef.add(cdtext);
				textadded = true;
			}
			var i:int = (cd / 45)+1;
			cdtext.text = "" + i;
			if (cd > 0) {
				cd--;
				loadGraphic(hb_slotcd_Image);
				cdtext.visible = true;
			} else {
				loadGraphic(hb_slot_Image);
				cdtext.visible = false;
			}
			if (FlxG.mouse.justPressed() && cd == 0 && !hbRef.gameStateRef.st.skillTreeOpened) {
				//if the player click on this hot bar slot to use the slime
				if ((FlxG.mouse.x >= x && FlxG.mouse.x <= x + 75) && (FlxG.mouse.y >= y && FlxG.mouse.y <= y + 75)) {
					//use slime
					switch(spawnType)
					{
						case SPAWN_TYPE_AUGMENTOR:
							spawnIfJello("augmentor", 44, 50);
							break;
						case SPAWN_TYPE_BARRIER:
							spawnIfJello("barrier", 44, 50);
							break;
						case SPAWN_TYPE_BOMBER:
							spawnIfJello("bomber", 44, 50);
							break;
						case SPAWN_TYPE_CLEAVER:
							spawnIfJello("cleaver", 44, 50);
							break;
						case SPAWN_TYPE_DESTRUCTOR:
							spawnIfJello("destructor", 44, 50);
							break;
						case SPAWN_TYPE_FIGHTER:
							spawnIfJello("fighter", 75, 150);
							break;
						case SPAWN_TYPE_FREEZER:
							spawnIfJello("freezer", 44, 50);
							break;
						case SPAWN_TYPE_HEALER:
							spawnIfJello("healer", 44, 50);
							break;
						case SPAWN_TYPE_MINER:
							spawnIfJello("miner", 44, 50);
							break;
						case SPAWN_TYPE_SHOOTER:
							spawnIfJello("shooter", 44, 50);
							break;
					}
					
					// Uncomment to add others to cooldown
					//hbRef.cooldownothers(skill);
				}
			}
			//collision y 896
		}
		
		public function addcd(amt:int):void {
			if (cd == 0)
				cd += amt;
		}
		
		private function spawnIfJello(spawnName:String, jello:int, cooldown:int):void
		{
			if (hbRef.gameStateRef.jello >= jello) {
				hbRef.gameStateRef.makeSlime(spawnName);
				hbRef.gameStateRef.jello -= jello;
				cd = cooldown;								
			}
		}
		
		public function addthing():void {
			switch (spawnType) {
				//evo 1		
				case SPAWN_TYPE_AUGMENTOR:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_BARRIER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_BOMBER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_CLEAVER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_DESTRUCTOR:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_FIGHTER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_FREEZER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_HEALER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_SHOOTER:
					img = new FlxSprite(x+22, y + 11, SpriteSheet.slimeFighter);
					break;
				case SPAWN_TYPE_MINER:
					var img:FlxSprite = new FlxSprite(x+22, y + 11, SpriteSheet.slimeMiner);
					break;
			}
			img.scrollFactor.x = img.scrollFactor.y = 0;
			img.scale = new FlxPoint(2, 2);
			hbRef.gameStateRef.add(img);

		}
	}
}