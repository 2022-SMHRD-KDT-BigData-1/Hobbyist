package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class RecommendDTO {
	private String a_id; 
	private String a_name;
	private String a_address;
	private String a_note;
	private String a_L_category;
	private String a_m_category;
	private String a_city;
}
