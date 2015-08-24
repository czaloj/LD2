package 
{
	import game.EntityStats;

	public class SkillPath
	{
		
		private const upgrades:Array = new Array(new SkillUpgrade(0));
		
		private var path:int = 0;
		private var level:int = 0;
		private var tier:int = 0;
		private var stats:EntityStats;
		
		public var root:Node = new Node(0, 
			0,
			new Node(1, 
				new Node(4),
				new Node(5),
				new Node(6)
			),
			new Node(2, 
				new Node(7),
				new Node(8),
				new Node(9)
			),
			new Node(3, 
				new Node(10),
				new Node(11),
				new Node(12)
			)
		);
		
		public function SkillPath(es:EntityStats) 
		{
			stats = es;
		}
		
		public function setUpgrades(...upgrades):void
		{
			for each (var u:SkillUpgrade in upgrades)
			{
				upgrades.push(upgrade);
			}
		}
		
		function findNode(n:Node, id:int):Node
		{
			for each (var no:Node in n.next)
			{
				if (no.available)
				{
					if (no.id == id) return no;
					var nf:Node = findNode(n, id);
					if (nf != null) return nf;
				}
			}
			return null;
		}
		function cull(n:Node, id:int, inTree:Boolean):Boolean
		{
			var isFound:Boolean = (n.id == id) || inTree;
			n.available = isFound;
			for each(var no:Node in n.next)
			{
				n.available = ((cull(no, id, isFound)) || n.available);
			}
			return n.available;
		}
		
		function upgrade(state:GameState, id:int):Boolean
		{
			var n:Node = findNode(root, id);
			if (n != null && !n.used)
			{
				var s:SkillUpgrade = upgrades[id];
				if (state.jello >= s.cost)
				{
					// Apply the upgrade
					state.jello -= s.cost;
					cull(root, id, false);
					n.used = true;
					s.apply(state, stats);
					return true;
				}
			}
			return false;
		}
	}
}