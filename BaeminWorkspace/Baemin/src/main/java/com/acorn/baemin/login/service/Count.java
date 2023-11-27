package com.acorn.baemin.login.service;

import java.util.Scanner;

public class Count {

    public static int count(int N) {
        int count = 0;
        for (int i = 1; i < N; i++) {
            int sum = 0;
            for (int j = i; j < N; j++) {
                sum += j;
                if (sum == N) {
                    count++;
                    break;
                } else if (sum > N) {
                    break;
                }
            }
        }
        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("숫자를 입력하세요 : ");
        int N = scanner.nextInt();
        int result = count(N);
	System.out.println("결과 : " + result);
    }
}
