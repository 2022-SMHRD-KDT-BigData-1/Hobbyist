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
	public AcademyDTO(String a_id2, String a_classname2, String a_tel2, String a_address2) {
	
	}
	private int a_seq;
	private String a_id; // �п��ڵ�
	private String a_classname;// �п���
	private String a_address;
	private String a_tel;
	private String a_day;
	private String a_time;
	private String a_position;
	private int a_category;// ��з�
	private int a_m_category;// �Һз�
	private int a_up;// ��õ��
}
