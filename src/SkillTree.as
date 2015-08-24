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
			skillPaths[SlimeID.AUGMENTOR].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_BUFF_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_BUFF_ATTACK_SPEED, 100),
				new SkillUpgrade(150, SkillUpgrade.TARGET_BUFF_DAMAGE, 0.5),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_HEALTH, 100),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_ATTACK_SPEED, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_DAMAGE, 0.5),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_HEALTH, 100),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_ATTACK_SPEED, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_DAMAGE, 0.5),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_HEALTH, 100),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_ATTACK_SPEED, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BUFF_DAMAGE, 0.5)
			);
			
			skillPaths[SlimeID.BARRIER] = new SkillPath(EntityStats.BARRIER);
			skillPaths[SlimeID.BARRIER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_BARRIER_DAMAGE_RETURN, 10),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 100),
				new SkillUpgrade(150, SkillUpgrade.TARGET_BARRIER_KNOCKBACK, 8),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_DAMAGE_RETURN, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_KNOCKBACK, 15),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_DAMAGE_RETURN, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_KNOCKBACK, 15),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_DAMAGE_RETURN, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 150),
				new SkillUpgrade(300, SkillUpgrade.TARGET_BARRIER_KNOCKBACK, 15)
			);
			
			skillPaths[SlimeID.BOMBER] = new SkillPath(EntityStats.BOMBER);
			skillPaths[SlimeID.BOMBER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK, 40),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK_SPEED, 50),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 60),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 60),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 60),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50)
			);
			
			skillPaths[SlimeID.CLEAVER] = new SkillPath(EntityStats.CLEAVER);
			skillPaths[SlimeID.CLEAVER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK, 10),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15)
			);
			
			skillPaths[SlimeID.DESTRUCTOR] = new SkillPath(EntityStats.DESTRUCTOR);
			skillPaths[SlimeID.DESTRUCTOR].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK, 75),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_COOLDOWN, 100),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 125),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_COOLDOWN, 150),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 125),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_COOLDOWN, 150),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 125),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_COOLDOWN, 150)
			);
			
			skillPaths[SlimeID.FIGHTER] = new SkillPath(EntityStats.FIGHTER);
			skillPaths[SlimeID.FIGHTER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK, 20),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_MOVESPEED, 100),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 25),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 150),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 25),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 150),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 25),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 150)
			);
			
			skillPaths[SlimeID.FREEZER] = new SkillPath(EntityStats.FREEZER);
			skillPaths[SlimeID.FREEZER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_SLOW_AMOUNT, 20),
				new SkillUpgrade(150, SkillUpgrade.TARGET_SLOW_LENGTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK_SPEED, 30),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_AMOUNT, 20),
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_LENGTH, 50),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_AMOUNT, 25),
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_LENGTH, 50),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_AMOUNT, 25),
				new SkillUpgrade(300, SkillUpgrade.TARGET_SLOW_LENGTH, 50),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 50)
			);
			
			skillPaths[SlimeID.HEALER] = new SkillPath(EntityStats.HEALER);
			skillPaths[SlimeID.HEALER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEAL_AMOUNT, 1),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEAL_SPEED, 5), //starts 15
				new SkillUpgrade(150, SkillUpgrade.TARGET_MOVESPEED, 75),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_AMOUNT, 1),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_SPEED, 5),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 100),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_AMOUNT, 1),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_SPEED, 5),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 100),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_AMOUNT, 1),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEAL_SPEED, 5),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 100)
			);
			
			skillPaths[SlimeID.MINER] = new SkillPath(EntityStats.MINER);
			skillPaths[SlimeID.MINER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_MINING_AMOUNT, 3),
				new SkillUpgrade(150, SkillUpgrade.TARGET_MOVESPEED, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_ORE_CAPACITY, 25),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_MINING_AMOUNT, 6),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ORE_CAPACITY, 50),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_MINING_AMOUNT, 6),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ORE_CAPACITY, 50),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_MINING_AMOUNT, 6),
				new SkillUpgrade(300, SkillUpgrade.TARGET_MOVESPEED, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ORE_CAPACITY, 50)
			);
			
			skillPaths[SlimeID.SHOOTER] = new SkillPath(EntityStats.SHOOTER);
			skillPaths[SlimeID.SHOOTER].setUpgrades(
				// Tier 1 Upgrades
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK, 10),
				new SkillUpgrade(150, SkillUpgrade.TARGET_HEALTH, 50),
				new SkillUpgrade(150, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 1 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 15),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 2 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 15),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15),
				
				// Tier 2 From Evo 3 Upgrades
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 15),
				new SkillUpgrade(300, SkillUpgrade.TARGET_HEALTH, 75),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK_SPEED, 15)
			);		
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