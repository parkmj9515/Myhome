package himedia.myhome.vo;

import java.util.Date;

public class UserVo {

	private Long no;
	private String name;
	private String password;
	private String email;
	private String gender;
	private Date createAt;

	// 기본생성자 = 필수
	public UserVo() {
	}

	// 필드 생성자
	public UserVo(Long no, String name, String password, String email, String gender, Date createAt) {
		super();
		this.no = no;
		this.name = name;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.createAt = createAt;
	}

	public UserVo(String name, String password, String email, String gender) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.gender = gender;
	}

	// Getter Setter
	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	// toString 내부데이터 문자형식으로 리턴
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", name=" + name + ", password=" + password + ", email=" + email + ", gender="
				+ gender + ", createAt=" + createAt + "]";
	}

}