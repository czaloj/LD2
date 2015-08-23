package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HotBarSlot extends FlxSprite 
	{
		[Embed(source = "images/hb_slot.png")]
		public var hb_slot_Image:Class;
		[Embed(source = "images/hb_slot_cd.png")]
		public var hb_slotcd_Image:Class;
		
		public var hbRef:HotBar;
		public var skill:int;
		public var cd:int = 0;
		
		public var cdtext:FlxText;
		public var textadded:Boolean = false;
		
		public function HotBarSlot(skillIn:int, hbRefIn:HotBar, X:Number=0) 
		{
			super(X, 620, hb_slot_Image);
			hbRef = hbRefIn;
			skill = skillIn;
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
					if (skill == 10 && hbRef.gameStateRef.jello >= 44 ) {
						hbRef.gameStateRef.makeSlime("miner");
						hbRef.gameStateRef.jello -= 44;
						cd = 50;
					}
					if (skill == 1 && hbRef.gameStateRef.jello >= 75 ) {
						hbRef.gameStateRef.makeSlime("fighter");
						hbRef.gameStateRef.jello -= 75;
						cd = 150;
					}
					
					//hbRef.cooldownothers(skill);
					
					
				}
			}
			//collision y 896
		}
		
		public function addcd(amt:int):void {
			if (cd == 0)
				cd += amt;
		}
		
		public function addthing():void {
			var img:FlxSprite;
			if (skill == 10) {
				//evo 1
				img = new FlxSprite(x+6, y-7, hbRef.gameStateRef.miner_Image);
				img.scrollFactor.x = img.scrollFactor.y = 0;
				hbRef.gameStateRef.add(img);
			}
			if (skill == 1) {
				//evo 1
				img = new FlxSprite(x+22, y + 11, hbRef.gameStateRef.fighter_Image);
				img.scrollFactor.x = img.scrollFactor.y = 0;
				img.scale = new FlxPoint(2, 2);
				hbRef.gameStateRef.add(img);
			}
		}
		
	}

}