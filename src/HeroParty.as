package 
{
	public class HeroParty 
	{
		private var state:GameState;
		
		public var heroes:Array = new Array();

		public function HeroParty(state:GameState)
		{
			this.state = state;
		}
		
		public function spawn():void
		{
			heroes.push(new HeroMelee(state, 30, 890));
		}
	}
}