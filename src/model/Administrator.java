package model;

import javax.persistence.*;

@Entity
public class Administrator {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String nickname;

	@Column(nullable = false)
	private String password;
	
	public Administrator (String username, String password) {
		this.nickname = username;
		this.password = password;
	}
	
	public boolean verificaPassword(String password) {
		return this.password.equals(password);
	}
	
	
	public Long getId() {
		return id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
