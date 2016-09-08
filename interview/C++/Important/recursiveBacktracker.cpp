
bool Solve(Configuration conf){
  if(no more choices) // Base Case
	 return (conf is goal State?);

  for(all available choice){
     try one choice c; // Solve from here
     if(Solve(conf with choice c made)) return true;
   uname choice c;
  }
 return false;//  tried all choices, no solution found
}

