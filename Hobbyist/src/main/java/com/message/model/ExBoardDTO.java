package com.message.model;

import java.sql.Timestamp;

import com.message.model.CommunityDTO2;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
//모든 변수를 포함한 생성자를 생성해줌

public class ExBoardDTO {
	private int no;
	private String name;
	private String passwd;
	private String subject;
	private String content;
	private Timestamp reg_date;
	private int readCount;
	private String ip;

}
