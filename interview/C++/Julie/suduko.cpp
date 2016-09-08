

bool SolveSudoko(Grid<int> &grid){
  int row, col;
 
  if(!FindUnassignedLocation(Grid, row, col))
	return true;

  for(int num = 1; num <= 9; num++){
    if(NoConflicts(grid, row, col, num)){
	 grid(row, col) = num;
         if(SolveSudoku(grid)) 
		return true;
	  grid(row, col) = UNASSIGNED;
   }
  }
  return false;
}

static bool NoConflicts(Grid<int> &board, int &row, int &col, int num){
  for(int i=0; i< kBoardDimension; i++){
    if(board[row][i] == num){
	  return true;
	}
  }
  
  for(int i=0; i< kBoardDimension; i++){
    if(board[i][col] == num){
	  return true;
	}
   }
  return false;
}


static bool FindUnassignedLocation(Grid<int>& board, int& row, int& col) { 
    for (row = 0; row < kBoardDimension; row++) {
	for (col = 0; col < kBoardDimension; col++) { 
		if (board[row][col] == UNASSIGNED) 
			return true;
		} 
	}
    return false; 
}
