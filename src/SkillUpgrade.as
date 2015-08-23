package 
{
	import game.EntityStats;
	public class SkillUpgrade 
	{
		public static const TARGET_ATTACK:int = 1 << 0;
		public static const TARGET_HEALTH:int = 1 << 1;
		public static const TARGET_MOVESPEED:int = 1 << 2;
		public static const TARGET_COOLDOWN:int = 1 << 3;
		public static const TARGET_ATTACK_SPEED:int = 1 << 4;
		public static const TARGET_SPECIAL_1:int = 1 << 5;
		public static const TARGET_SPECIAL_2:int = 1 << 6;
		public static const TARGET_SPECIAL_3:int = 1 << 7;
		
		
		public var target:int = 0;
		
		public var attack:int = 0;
		public var health:int = 0;
		public var moveSpeed:Number = 0.0;
		public var coolDown:int = 0;
		public var attackSpeed:int = 0;
		public var special1:int = 0;
		public var special2:int = 0;
		public var special3:int = 0;
		
		public function SkillUpgrade(...changes)
		{
			for (var i:int = 0; i < changes.length; )
			{
				var t:int = changes[i++];
				switch(t)
				{
					case TARGET_ATTACK:
						attack += changes[i++];
						break;
					case TARGET_HEALTH:
						health += changes[i++];
						break;
					case TARGET_MOVESPEED:
						moveSpeed += changes[i++];
						break;
					case TARGET_COOLDOWN:
						coolDown += changes[i++];
						break;
					case TARGET_ATTACK_SPEED:
						attackSpeed += changes[i++];
						break;
					case TARGET_SPECIAL_1:
						special1 += changes[i++];
						break;
					case TARGET_SPECIAL_2:
						special2 += changes[i++];
						break;
					case TARGET_SPECIAL_3:
						special3 += changes[i++];
						break;
				}
				target |= t;
			}
		}
		
		public function apply(state:GameState, stats:EntityStats):void
		{
			if (target & TARGET_ATTACK) stats.attack += attack;
			if (target & TARGET_HEALTH) stats.health += health;
			if (target & TARGET_ATTACK_SPEED) stats.attackSpeed += attackSpeed;
			if (target & TARGET_MOVESPEED) stats.moveSpeed += moveSpeed;
			if (target & TARGET_SPECIAL_1) stats.special1 += special1;
			if (target & TARGET_SPECIAL_2) stats.special2 += special2;
			if (target & TARGET_SPECIAL_3) stats.special3 += special3;
			if (target & TARGET_COOLDOWN) stats.cooldown += coolDown;
		}
	}

}