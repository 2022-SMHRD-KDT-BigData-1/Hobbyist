package com.message.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
//모든 필드변수를 초기화하는 생성자를 생성해줌.
//변수, 생성자, getter/setter, toString() 정의

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
