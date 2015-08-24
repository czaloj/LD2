package  
{
	import game.EntityStats;
	import graphics.SpriteSheet;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Wisp X
	 */
	public class SkillTree extends FlxSprite 
	{
		[Embed(source = "images/skilltreebg.png")]
		public var skillTreeBG_Image:Class;
		
		//group for stuff that's contained in the skill tree window like buttons and such
		public var skillTreeWindow:FlxGroup;
		
		//is the skill tree window opened?
		public var skillTreeOpened:Boolean = false;
		
		public var gameStateRef:GameState;
		
		private var skillPaths:Array = null;
		
		private var currentTab:int = SlimeID.FIGHTER;
		
		private var tabGroups:Array = new Array();
		
		
		public function SkillTree(gameStateRefIn:GameState) 
		{
			super(150, 60000, skillTreeBG_Image);
			gameStateRef = gameStateRefIn;
			
			generateSkillPaths();
			createTabs();
			
			skillTreeWindow = new FlxGroup();
			skillTreeWindow.add(tabGroups[currentTab]);
			skillPaths[currentTab].forEachUpgrade(grayOutPiece);
			
			gameStateRef.add(skillTreeWindow);
			scrollFactor.x = scrollFactor.y = 0;
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("E")) {
				if (skillTreeOpened) {
					y = 50;
					velocity.y = 2300;
					//skillTreeWindow.visible = false;
					skillTreeOpened = false;
				} else {
					y = 600;
					velocity.y = -2300;
					//skillTreeWindow.visible = true;
					skillTreeOpened = true;
				}
				gameStateRef.jello += 15;
			}
			if (y < 50) {
				velocity.y = 0;
				y = 50;
			}
		}
		
		private function changeTab(tab:int):void
		{
			var group:FlxGroup = tabGroups[currentTab];
			skillTreeWindow.remove(group);
			currentTab = tab;
			group = tabGroups[currentTab];
			skillTreeWindow.add(group);
			
			skillPaths[currentTab].forEachUpgrade(grayOutPiece);
		}
		private function grayOutPiece(id:int, available:Boolean):void
		{
			var group:FlxGroup = tabGroups[currentTab];
			var sprite:FlxSprite = group[id];
			sprite.color = available ? 0xffffff : 0x666666;
		}
		
		private function generateSkillPaths():void
		{
			skillPaths = new Array();
			skillPaths.length = 10;
			
			skillPaths[SlimeID.AUGMENTOR] = new SkillPath(EntityStats.AUGMENTOR);
			// TODO Add Stats
			
			skillPaths[SlimeID.BARRIER] = new SkillPath(EntityStats.BARRIER);
			// TODO Add Stats
			
			skillPaths[SlimeID.BOMBER] = new SkillPath(EntityStats.BOMBER);
			// TODO Add Stats
			
			skillPaths[SlimeID.CLEAVER] = new SkillPath(EntityStats.CLEAVER);
			// TODO Add Stats
			
			skillPaths[SlimeID.DESTRUCTOR] = new SkillPath(EntityStats.DESTRUCTOR);
			// TODO Add Stats
			
			skillPaths[SlimeID.FIGHTER] = new SkillPath(EntityStats.FIGHTER);
			skillPaths[SlimeID.FIGHTER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_HEALTH, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK_SPEED, 20),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_HEALTH, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK_SPEED, 20),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_HEALTH, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK_SPEED, 20),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_HEALTH, 20),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK_SPEED, 20)
			);
			
			skillPaths[SlimeID.FREEZER] = new SkillPath(EntityStats.FREEZER);
			// TODO Add Stats
			
			skillPaths[SlimeID.HEALER] = new SkillPath(EntityStats.HEALER);
			// TODO Add Stats
			
			skillPaths[SlimeID.MINER] = new SkillPath(EntityStats.MINER);
			// TODO Add Stats
			
			skillPaths[SlimeID.SHOOTER] = new SkillPath(EntityStats.SHOOTER);
			// TODO Add Stats			
		}
		
		private function createTabs():void
		{
			tabGroups.length = 10;
			tabGroups[SlimeID.FIGHTER] = createTab(
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter,
				SpriteSheet.slimeFighter
			);
			trace("Hello");
		}
		private function createTab(...images):FlxGroup
		{
			var g:FlxGroup = new FlxGroup();
			g.add(new FlxSprite(0, 0, images[0]));
			g.add(new FlxSprite(0, 0, images[1]));
			g.add(new FlxSprite(0, 0, images[2]));
			g.add(new FlxSprite(0, 0, images[3]));
			g.add(new FlxSprite(0, 0, images[4]));
			g.add(new FlxSprite(0, 0, images[5]));
			g.add(new FlxSprite(0, 0, images[6]));
			g.add(new FlxSprite(0, 0, images[7]));
			g.add(new FlxSprite(0, 0, images[8]));
			g.add(new FlxSprite(0, 0, images[9]));
			g.add(new FlxSprite(0, 0, images[10]));
			g.add(new FlxSprite(0, 0, images[11]));
			g.add(new FlxSprite(0, 0, images[12]));
			return g;
		}
	}

}