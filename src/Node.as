package 
{
	class Node
	{
		public var next:Array;
		public var id:int;
		public var available:Boolean = true;
		public var used:Boolean = false;
		
		public function Node(id:int, ...nodes)
		{
			this.id = id;
			next = new Array();
			for each (var n:Node in nodes) next.push(n);
		}
	}

}