package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class CommunityDTO {
	private int c_seq;
	private String m_nick;
	private String c_title;
	private String c_writer;
	private String c_pw;
	private String c_view;
	private String c_date;
	
}

