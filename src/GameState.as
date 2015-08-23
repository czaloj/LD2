package  
{
	import game.GameExecutionState;
	import game.State;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class GameState extends FlxState 
	{
		[Embed(source = "images/map.png")]
		public var mapbg_Image:Class;
		
		public var state:State = null;
		
		//resource
		public var jello:int = 44000;
		
		public var st:SkillTree;
		public var hb:HotBar;
		
		public var cam:FlxCamera;
		public var player:FlxSprite;
		public var cloudGroup:FlxGroup;
		public var slimeOreGroup:FlxGroup;
		public var slimeGroup:FlxGroup;
		public var emitterGroup:FlxGroup;
		private var heroParty:HeroParty;
		
		public var oreMax:int = 25;
		public var base:Base;
		
		public var hero:HeroMelee;
		
		override public function create():void {
			super.create();
		
			//temporary blue background
			var mapbg:FlxSprite = new FlxSprite(0, 0, mapbg_Image);
			var tempWhite:FlxSprite = new FlxSprite(0, 0);
			tempWhite.makeGraphic(8000, 6000, 0xff66ccff);
			add(tempWhite);
			//clouds
			cloudGroup = new FlxGroup();
			add(cloudGroup);
			makeClouds();
			add(mapbg);
			
			slimeGroup = new FlxGroup();
			slimeOreGroup = new FlxGroup();
			slimeOreGroup.add(new SlimeOre(this, 3000, 809));
			add(slimeOreGroup);
			
			//hot bar stuff
			hb = new HotBar(this);
			add(hb);
			hb.createJelloText();
			
			// Create the game state here
			state = new State();
			
			
			
			player = new FlxSprite(2000, 350);
			player.makeGraphic(1200, 800, 0x00000000);
			add(player);
			
			//camera (temporary???)
			cam = new FlxCamera(0, 0, 1200, 800);
			cam.follow(player);
			// this sets the limits of where the camera goes so that it doesn't show what's outside of the tilemap
			cam.setBounds(0,0, 3200, 1280);
			//cam.color = 0xFFCCCC; // add a light red tint to the camera to differentiate it from the other
			FlxG.addCamera(cam);
			
			base = new Base(2560, 768);
			add(base);
			
			emitterGroup = new FlxGroup();
			
			// Spawn the party
			//heroParty = new HeroParty(this);
			//heroParty.spawn();
			
			//add the skill tree window
			st = new SkillTree(this);
			
			//hero test
			hero = new HeroMelee(this, 50, 807);
			add(hero);
		}
		
		override public function update():void {
			super.update();
			//jello++;
			
			//CAMERA MOVEMENT
			if (FlxG.mouse.x < 200) {
				player.x -= (200-FlxG.mouse.x)/6;
			}
			if (FlxG.mouse.x > 1000) {
				player.x += (FlxG.mouse.x-1000)/6;
			}
			if (player.x < 0)
				player.x = 0;
			if (player.x > 2000)
				player.x = 2000;
			if (player.y < 0)
				player.y = 0;
			if (player.y > 480)
				player.y = 480;
			
			switch (state.executionState)
			{
				case GameExecutionState.HEROES_WON:
					// TODO
					break;
				case GameExecutionState.SLIMES_WON:
					// TODO
					break;
				case GameExecutionState.PAUSED:
					break;
				case GameExecutionState.STILL_PLAYING:
					state.update();
					break;
				default:
					// Shouldn't happen
					break;
			}
		}
		
		public function next():void {
			//go back to menu
			FlxG.switchState(new MenuState());
		}
		
		public function makeSlime(slime:String):void {
			switch(slime)
			{
				case "augmentor":
					slimeGroup.add(new SlimeAugmentor(this, 2600, 808));
					add(slimeGroup);
					break;					
				case "barrier":
					slimeGroup.add(new SlimeBarrier(this, 2600, 808));
					add(slimeGroup);
					break;
				case "bomber":
					slimeGroup.add(new SlimeBomber(this, 2600, 808));
					add(slimeGroup);
					break;
				case "cleaver":
					slimeGroup.add(new SlimeCleaver(this, 2600, 808));
					add(slimeGroup);
					break;
				case "destructor":
					slimeGroup.add(new SlimeDestructor(this, 2600, 808));
					add(slimeGroup);
					break;
				case "freezer":
					slimeGroup.add(new SlimeFreezer(this, 2600, 808));
					add(slimeGroup);
					break;
				case "healer":
					slimeGroup.add(new SlimeHealer(this, 2600, 808));
					add(slimeGroup);
					break;
				case "shooter":
					slimeGroup.add(new SlimeShooter(this, 2600, 808));
					add(slimeGroup);
					break;
				case "miner":
					slimeGroup.add(new SlimeMiner(this, 2600, 808));
					add(slimeGroup);
					break;
				case "fighter":
					slimeGroup.add(new SlimeFighter(this, 2600, 808));
					add(slimeGroup);
					break;
			}
		}
		
		public function makeClouds():void {
			for (var ia:int = 0; ia < 5; ia++) {
				var newCloud:Cloud = new Cloud();
				cloudGroup.add(newCloud);
			}
		}
	}
}