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
public class AcademyDTO {
	private String a_name;
	private String a_day;
	private String a_address;
	private String a_tel;
	private String a_time;
	private int a_category;// ��з�
	private int a_m_category;// �Һз�
	/*
	 * hashtag�� ����
	 * 1. Ȱ������
	 * 2. ������
	 * 3. ������
	 * 4. ��������
	 * 5. 
	 * */
}
