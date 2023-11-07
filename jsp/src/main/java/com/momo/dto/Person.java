package com.momo.dto;

public class Person {
	private String name;
	private int age;
	
	// 기본 생성자
	public Person() {}
	
	@Override
	public String toString() {
		return name + "/" + age;
	}

	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
		
}
