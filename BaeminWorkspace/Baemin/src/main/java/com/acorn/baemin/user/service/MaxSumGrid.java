package com.acorn.baemin.user.service;

import java.util.Scanner;

public class MaxSumGrid {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("격자판의 크기를 입력하세요: ");
        int n = sc.nextInt();

        int[][] grid = new int[n][n];

        System.out.println(n + "*" + n + " 행의 내용을 입력하세요: ");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                grid[i][j] = sc.nextInt();
            }
        }

        int maxSum = findMaxSum(grid);
        System.out.println("가장 큰 합은: " + maxSum);
    }

    public static int findMaxSum(int[][] grid) {
        int n = grid.length;
        int maxSum = Integer.MIN_VALUE;

        // 각 행의 합 중 가장 큰 값을 찾음
        for (int i = 0; i < n; i++) {
            int rowSum = 0;
            for (int j = 0; j < n; j++) {
                rowSum += grid[i][j];
            }
            maxSum = Math.max(maxSum, rowSum);
        }

        // 각 열의 합 중 가장 큰 값을 찾음
        for (int j = 0; j < n; j++) {
            int colSum = 0;
            for (int i = 0; i < n; i++) {
                colSum += grid[i][j];
            }
            maxSum = Math.max(maxSum, colSum);
        }

        // 첫 번째 대각선의 합 계산
        int diagonal1Sum = 0;
        for (int i = 0; i < n; i++) {
            diagonal1Sum += grid[i][i];
        }
        maxSum = Math.max(maxSum, diagonal1Sum);

        // 두 번째 대각선의 합 계산
        int diagonal2Sum = 0;
        for (int i = 0; i < n; i++) {
            diagonal2Sum += grid[i][n - 1 - i];
        }
        maxSum = Math.max(maxSum, diagonal2Sum);

        return maxSum;
    }
}


