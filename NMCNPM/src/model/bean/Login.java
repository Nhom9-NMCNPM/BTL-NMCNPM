package model.bean;

public class Login {
	private String user;
	
	public Login(String user) {
		super();
		this.user = user;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Login() {
		super();
	}
}
