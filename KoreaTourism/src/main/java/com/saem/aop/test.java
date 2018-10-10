package com.saem.aop;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public class test {
	public int[] solution(int[] arr) {
		List<Integer> answer = new ArrayList<>();
        int count = 0;
        answer.add(arr[0]);
        for(int i = 1; i < arr.length; i++){
            if(answer.get(count) != arr[i]){
                answer.add(arr[i]);
                count++;
            }
        }
        int[] a = new int[answer.size()];
        for(int i=0; i<a.length; i++){
            a[i] = answer.get(i);
        }
        return a;
	}
	public static void main(String[] args) {
		test a = new test();
		int[] b = {1,1,3,3,0,1,1};
		int[] aa = a.solution(b);
		for(int i = 0; i<aa.length; i++) {
			System.out.print(aa[i] + ",");
		}
		
	}
}
