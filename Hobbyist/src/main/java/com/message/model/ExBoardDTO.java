package com.message.model;

import java.sql.Timestamp;

import com.message.model.CommunityDTO2;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
//��� ������ ������ �����ڸ� ��������

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
