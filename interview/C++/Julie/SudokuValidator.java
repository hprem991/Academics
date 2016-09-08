import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class SudokuValidator {
    
    public static boolean sudoku_solve(int [][]grid){
        for(int row = 0; row < 9; row++){
            for(int col = 0; col < 9; col++){
                int num = grid[row][col];
                if(!isSafe(grid, row, col, num)){
                   return false; 
                }
            }
        }
        return true;
    }

    
    public static boolean isConflict(int [][] grid, int row, int col, int num){
        for(int rowI = 0 ; rowI < 9; rowI++){
            if(rowI == row) continue;
            if(grid[rowI][col] == num){
                System.out.println("Conflict "+grid[rowI][col] +" row "+rowI+" col "+col);
                return true;
            }
        }
        
        for(int colI = 0; colI < 9; colI++){
            if(colI == col) continue;
            if(grid[row][colI] == num) {
                
                System.out.println("Conflict "+grid[row][colI] +" row "+row+" col "+colI);
                return true;
            }
        }
        
        for(int rowI=0; rowI < 9; rowI++){
            for(int colI=0; colI < 9; colI++){
                if((rowI == row) &&(colI == col)) continue;
                if(grid[rowI + row - row %3][colI + col - col%3] == num){                   
                    System.out.println("Conflict "+grid[rowI][colI] +" row "+rowI+" col "+colI);
                    return true;
                }
            }
        }
        return false;
    }
    
    
    static boolean usedInRow(int [][]board, int row, int colI, int num){
        for(int col=0; col < 9; col++){
            if(colI == col) continue;
            if(board[row][col] == num) {
                System.out.println("Conflict Row "+board[row][col]+" row "+row+" col "+col);
                return true;
            }
        }
        return false;
    }
    
    
    static boolean usedInCol(int [][]board, int rowI, int col, int num){
        for(int row = 0; row < 9; row++){
            if(rowI == row) continue;
            if(board[row][col] ==  num){   
                System.out.println("Conflict Col "+board[row][col]+" row "+row+" col "+col);
                return true;
            }
        }
        return false;
    }
    
    static boolean usedInBox(int [][]board,int rowI, int colI,  int rowStart, int colStart, int num){
       for(int row = 0; row < 3; row++ ){
           for(int col = 0; col < 3; col++){
               if((rowI == (row+rowStart)) && (colI == (col+colStart))) continue;
               if(board[row+rowStart][col+colStart] == num){
                   System.out.println("Conflict Box "+board[row][col]+" row "+row+" col "+col);
                   return true;
               }
           }
       }    
        return false;
    }
    
    static boolean isSafe(int [][] board, int row, int col, int num){
        return !usedInRow(board, row, col, num) &&
               !usedInCol(board, row, col, num) &&
               !usedInBox(board, row, col, row - row%3, col - col%3, num);
    }
    
    
    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */ 
        Scanner in = new Scanner(System.in);
        int n;
        int board[][] = new int[9][9];

        n = in.nextInt();

        for(int i = 0; i < n; i++) {
            for(int j = 0; j < 9; j++) {
                for(int k = 0; k < 9; k++) {
                    board[j][k] = in.nextInt();
                }
            }
            if (sudoku_solve(board) == true) {
                 System.out.println("Valid");
            } else {
                 System.out.println("Invalid");
               }
          }
    }
}  
