
bool Solve(Grid<board> &board, int col){
   if(col >= board.numCols() return true;// base case

    for(int rowTotry = 0; rowTotry < board.numRows(); rowTotry++){
   if(IsSafe(board,rowTotry, col)){
	PlaceQueen(board, rowTotry, col);
        if(Solve(board, col + 1)) return true;
		RemoveQueen(board, rowTotry, col);
	}
   }
   retrun false;
}
