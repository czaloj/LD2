package 
{
	import game.EntityStats;
	public class SkillPath 
	{
		private const upgrades:Array = new Array(
			new Array(
				new Array()
			),
			new Array(
				new Array(),
				new Array(),
				new Array()
			),
			new Array(
				new Array(),
				new Array(),
				new Array(),
				new Array(),
				new Array(),
				new Array(),
				new Array(),
				new Array(),
				new Array()
			)
		);
		
		private var path:int = 0;
		private var level:int = 0;
		private var tier:int = 0;
		private var stats:EntityStats;
		
		public function SkillPath(es:EntityStats) 
		{
			stats = es;
		}
		
		private function setTier1Upgrades(...upgrades):void
		{
			for each (var u:SkillUpgrade in upgrades)
			{
				upgrades[0][0].push(upgrade);
			}
		}
		private function setTier2Upgrades(...upgrades):void
		{
			var i:int = 0;
			for each (var u:SkillUpgrade in upgrades)
			{
				upgrades[1][i / 5].push(upgrade);
				i++;
			}
		}
		private function setTier3Upgrades(...upgrades):void
		{
			var i:int = 0;
			for each (var u:SkillUpgrade in upgrades)
			{
				upgrades[2][i / 5].push(upgrade);
				i++;
			}
		}
		
		private function upgrade(state:GameState):Boolean
		{
			// Apply the upgrade
			var s:SkillUpgrade = upgrades[tier][path][level];
			s.apply(state, stats);

			// Increase the level
			level++;
			if (level == 5)
			{
				// A new evolution must be determined
				tier++;
				level = 0;
				path *= 3;
				return true;
			}
			return false;
		}
		
		private function setPath(p:int):void
		{
			path = p;
		}
	}

}