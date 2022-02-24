package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class MarkerDTO {
	private String AC_ID; 
	private String AC_NAME;
	private String AC_CITY;
	private String AC_SI;
	private String AC_DONG;
	private String AC_ADDR;
	private String AC_CATEGORY;
	private String A_IMG;
	private String AC_REV;
	private String AC_REL;
	private String AC_WI;
	private String AC_KY;
}
