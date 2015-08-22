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
		public var jello:int = 44;
		
		public var st:SkillTree;
		public var hb:HotBar;
		
		public var cam:FlxCamera;
		public var player:FlxSprite;
		public var cloudGroup:FlxGroup;
		public var slimeOreGroup:FlxGroup;
		public var slimeGroup:FlxGroup;
		
		public var oreMax:int = 100;
		public var base:Base;
		
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
			add(slimeOreGroup);
			slimeOreGroup.add(new SlimeOre(2900, 809));
			
			//hot bar stuff
			hb = new HotBar(this);
			add(hb);
			hb.createJelloText();
			
			// Create the game state here
			state = new State();
			
			//add the skill tree window
			st = new SkillTree(this);
			add(st);
			
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
			
			base = new Base(2100, 768);
			add(base);
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
		
		public function makeSlime():void {
			var newSlime:Slime = new Slime(this, (player.x+600)+(-200+(Math.random()*400)), 500);
			slimeGroup.add(newSlime);
			add(slimeGroup);
		}
		
		public function makeClouds():void {
			for (var ia:int = 0; ia < 5; ia++) {
				var newCloud:Cloud = new Cloud();
				cloudGroup.add(newCloud);
			}
		}
	}
}