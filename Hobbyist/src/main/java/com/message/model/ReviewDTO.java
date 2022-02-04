package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class ReviewDTO {
	private int r_num;
	private String r_nick;
	private String r_name;//학원 이름
	private String r_pw;//일반 비밀번호와 다른 비밀번호
	private String r_content;
	private int r_score;
	private String r_date;
}
