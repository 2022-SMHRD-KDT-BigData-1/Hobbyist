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

public class MapInfoDTO {
	private String ac_id;
	private String ac_name;
	private String ac_city;
	private String ac_si;
	private String ac_dong;
	private String ac_addr;
	private String ac_category;
	private String ac_img;
	private String ac_rev;
	private String ac_rel;
	private String ac_wi;
	private String ac_ky;
}
