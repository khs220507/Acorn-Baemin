package com.acorn.baemin.user.service;

import java.util.Scanner;

public class VisibleStudents {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("학생들의 키를 입력하세요 (띄어쓰기로 구분):");
        String[] heightsInput = scanner.nextLine().split(" ");
        int[] studentHeights = new int[heightsInput.length];
        
        for (int i = 0; i < heightsInput.length; i++) {
            studentHeights[i] = Integer.parseInt(heightsInput[i]);
        }

        int result = countVisibleStudents(studentHeights);
        System.out.println("맨 앞에 서 있는 선생님이 볼 수 있는 학생의 수: " + result);

        scanner.close();
    }

    public static int countVisibleStudents(int[] heights) {
        int visibleCount = 1; 
        int maxHeight = heights[0];

        for (int i = 1; i < heights.length; i++) {
            if (heights[i] > maxHeight) {
                visibleCount++;
                maxHeight = heights[i];
            }
        }

        return visibleCount;
    }
}



