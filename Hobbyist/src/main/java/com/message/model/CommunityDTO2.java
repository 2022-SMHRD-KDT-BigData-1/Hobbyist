package com.message.model;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
//��� ������ ������ �����ڸ� ��������

public class CommunityDTO2 {
	private int no;
	private String m_nick;
	private String c_pw;
	private String c_title;
	private String c_content;
	private Timestamp c_date;
	private int c_readCount;
	private String ip;
}







