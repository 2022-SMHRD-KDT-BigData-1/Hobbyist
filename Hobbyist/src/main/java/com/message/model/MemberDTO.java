package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
//��� �ʵ庯���� �ʱ�ȭ�ϴ� �����ڸ� ��������.
//����, ������, getter/setter, toString() ����

public class MemberDTO {
	private String m_email;
	private String m_pw;
	private String m_nick;
	private String m_tel;
	private String m_address;
	private String m_age;
	private String m_gender;
	private String m_hashtag;
	
	
	
}
