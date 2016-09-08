import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    static boolean sudoku_solve(int [][] grid){
        //your logic here
        
    int row = 0 , col = 0;
    boolean flag = false;    
     
    loop:    
    for(row=0; row < 9; row++){
         for(col = 0; col < 9; col++){
             if(grid[row][col] == 0){
                   flag = true;
                   break loop;
             }
         }
    } 
    
    if(!flag) return true; // all are filled
        
    for(int num = 1; num <= 9; num++){
        if(isSafe(grid, row, col, num)){
            grid[row][col] = num;
            if(sudoku_solve(grid))
                    return true;
            grid[row][col] = 0;
        }
     }
        return false;
    }
    
    
    static boolean usedInRow(int [][]board, int row, int num){
        for(int col=0; col < 9; col++){
            if(board[row][col] == num)
                return true;
        }
        return false;
    }
    
    
    static boolean usedInCol(int [][]board, int col, int num){
        for(int row = 0; row < 9; row++){
            if(board[row][col] ==  num)
                return true;
        }
        return false;
    }
    
    static boolean usedInBox(int [][]board, int rowStart, int colStart, int num){
       for(int row = 0; row < 3; row++ ){
           for(int col = 0; col < 3; col++){
               if(board[row+rowStart][col+colStart] == num){
                   return true;
               }
           }
       }    
        return false;
    }
    
    static boolean isSafe(int [][] board, int row, int col, int num){
        return !usedInRow(board, row, num) &&
               !usedInCol(board, col, num) &&
               !usedInBox(board, row - row%3, col - col%3, num);
    }
    
    static boolean NoConflicts(int [][] board, int row, int col, int num){
        for(int i=0; i< 9; i++){
            if(board[row][i] == num){
                   return true;
             }
         }
 
        for(int i=0; i< 9; i++){
            if(board[i][col] == num){
                   return true;
              }
          }
        
        for(int i=0; i < 3; i++){
            for(int j = 0; j < 3; j++){
                if(board[i + row - row %3][j + col - col%3] == num)
                    return true;
            }
        }
        return false;
      }
    
    
   static boolean FindUnassignedLocation(int [][] board, int row, int col) {
    for (row = 0; row < 9; row++) {
        for (col = 0; col < 9; col++) {
                if (board[row][col] == 0){
                        System.out.println("Row "+row+" Column " );
                        return true;
                  }
                }
          }
       return false;
    }
    
    static void printSudoku(int [][] grid){
         for(int j = 0; j < 9; j++) {
              for(int k = 0; k < 9; k++) {
                       System.out.print(grid[j][k]+" ");
                 }
              System.out.println();
           }
        System.out.println("\n");
    }
    
    
    public static void main(String[] args) {
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
            if (sudoku_solve(board) == true)
                 printSudoku(board);
             else {
                 System.out.println("No solution exists");}
 
        }
    }
}


