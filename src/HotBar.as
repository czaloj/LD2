package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class HotBar extends FlxSprite 
	{
		[Embed(source = "images/hotbarbg.png")]
		public var hbBG_Image:Class;
		
		public var jelloText:JelloText;
		public var gameStateRef:GameState;
		
		public var slime1:HotBarSlot;
		public var slime2:HotBarSlot;
		public var slime3:HotBarSlot;
		public var slime4:HotBarSlot;
		public var slime5:HotBarSlot;
		public var slime6:HotBarSlot;
		public var slime7:HotBarSlot;
		public var slime8:HotBarSlot;
		public var slime9:HotBarSlot;
		public var slime10:HotBarSlot;
		
		public var cd_1:int = 0;
		public var cd_2:int = 0;
		public var cd_3:int = 0;
		public var cd_4:int = 0;
		public var cd_5:int = 0;
		public var cd_6:int = 0;
		public var cd_7:int = 0;
		public var cd_8:int = 0;
		public var cd_9:int = 0;
		public var cd_10:int = 0;
		
		//3 seconds
		public var othercdtime:int = 25;
		
		public function HotBar(gameStateRefIn:GameState) 
		{
			super(200, 620, hbBG_Image);
			gameStateRef = gameStateRefIn;
			scrollFactor.x = scrollFactor.y = 0;
		}
		
		override public function update():void {
			super.update();
		}
		
		public function createJelloText():void {
			//jello text on hot bar
			jelloText = new JelloText(gameStateRef, x + 86, y + 105, 500, "");
			gameStateRef.add(jelloText);
			
			slime1 = new HotBarSlot(1, this, x + 0);
			gameStateRef.add(slime1);
			slime2 = new HotBarSlot(2, this, x + 80);
			gameStateRef.add(slime2);
			slime3 = new HotBarSlot(3, this, x + 160);
			gameStateRef.add(slime3);
			slime4 = new HotBarSlot(4, this, x + 240);
			gameStateRef.add(slime4);
			slime5 = new HotBarSlot(5, this, x + 320);
			gameStateRef.add(slime5);
			slime6 = new HotBarSlot(6, this, x + 400);
			gameStateRef.add(slime6);
			slime7 = new HotBarSlot(7, this, x + 480);
			gameStateRef.add(slime7);
			slime8 = new HotBarSlot(8, this, x + 560);
			gameStateRef.add(slime8);
			slime9 = new HotBarSlot(9, this, x + 640);
			gameStateRef.add(slime9);
			slime10 = new HotBarSlot(10, this, x + 720);
			gameStateRef.add(slime10);
		}
		
		public function cooldownothers(skillnum:int):void {
			if (skillnum != 1) {
				slime1.addcd(othercdtime);
			}
			if (skillnum != 2) {
				slime2.addcd(othercdtime);
			}
			if (skillnum != 3) {
				slime3.addcd(othercdtime);
			}
			if (skillnum != 4) {
				slime4.addcd(othercdtime);
			}
			if (skillnum != 5) {
				slime5.addcd(othercdtime);
			}
			if (skillnum != 6) {
				slime6.addcd(othercdtime);
			}
			if (skillnum != 7) {
				slime7.addcd(othercdtime);
			}
			if (skillnum != 8) {
				slime8.addcd(othercdtime);
			}
			if (skillnum != 9) {
				slime9.addcd(othercdtime);
			}
			if (skillnum != 10) {
				slime10.addcd(othercdtime);
			}
		}
	}

}