package  
{
	import game.EntityStats;
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
		
		public function SkillTree(gameStateRefIn:GameState) 
		{
			super(150, 60000, skillTreeBG_Image);
			gameStateRef = gameStateRefIn;
			
			skillTreeWindow = new FlxGroup();
			//skillTreeWindow.add(STUFF HERE);
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
			skillPaths[SlimeID.FIGHTER].setTier1Upgrades(
				new SkillUpgrade(100, SkillUpgrade.TARGET_ATTACK, 10), // TODO Change these probably
				new SkillUpgrade(100, SkillUpgrade.TARGET_HEALTH, 10),
				new SkillUpgrade(100, SkillUpgrade.TARGET_MOVESPEED, 10, SkillUpgrade.TARGET_HEALTH, 5),
				new SkillUpgrade(200, SkillUpgrade.TARGET_ATTACK, 10),
				new SkillUpgrade(300, SkillUpgrade.TARGET_ATTACK, 30, SkillUpgrade.TARGET_HEALTH, 5)
			);
			skillPaths[SlimeID.FIGHTER].setTier2Upgrades(
				//15 upgrades
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 10), // TODO Change these probably
				new SkillUpgrade(50, SkillUpgrade.TARGET_HEALTH, 10),
				new SkillUpgrade(50, SkillUpgrade.TARGET_MOVESPEED, 10, SkillUpgrade.TARGET_HEALTH, 5),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 10),
				new SkillUpgrade(50, SkillUpgrade.TARGET_ATTACK, 30, SkillUpgrade.TARGET_HEALTH, 5)
			);
			skillPaths[SlimeID.FIGHTER].setTier3Upgrades(
				// 45 upgrades

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
	}

}