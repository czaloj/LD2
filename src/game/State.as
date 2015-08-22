package game 
{
	public class State 
	{
		// If the game has reached a win or lo
		public var executionState:int = GameExecutionState.STILL_PLAYING;

		// A time counter
		private var frameCounter:int = 0;
		
		// All the entities
		private var entities:Array = new Array();
		private var heroes:Array = new Array();
		private var slimes:Array = new Array();
		
		public function State() 
		{
			
		}
		
		public function update():void
		{
			// Only update if we are still playing
			if (executionState != GameExecutionState.STILL_PLAYING) return;
			
			// Temp iters
			var entity:Entity;
			
			// Increase the frame
			frameCounter++;
			trace(frameCounter);
			
			// Entities perform their decision-making steps
			for each (entity in entities)
			{
				entity.decide(this);
			}
			
			// Entities act on their decisions
			for each (entity in entities)
			{
				entity.act(this);
			}

			// TODO Resolve physics
			
			// TODO Perform combat logic resolution
			var killCount:int = 0;
			
			// Cleanup killed entities
			if (killCount > 0)
			{
				var newEntities:Array = new Array();
				slimes = new Array();
				heroes = new Array();
				
				for each (entity in entities)
				{
					switch (entity.team)
					{
						case Team.HERO:
							heroes.push(entity);
							break;
						case Team.SLIME:
							slimes.push(entity);
							break;
						case Team.ORE:
							break;
						case Team.UNKNOWN:
							// How did we get here?
							break;
					}
					newEntities.push(entity);
				}
				
				// Swap to the new array
				entities = newEntities;
			}
			
			// Check end condition
			if (heroes.length == 0)
				executionState = GameExecutionState.SLIMES_WON;
			else if (slimes.length == 0)
				executionState = GameExecutionState.HEROES_WON;
		}
	}
}