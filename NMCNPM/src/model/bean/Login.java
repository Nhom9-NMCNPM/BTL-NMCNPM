package model.bean;

public class Login {
	
	public Login(String user) {
		super();
		this.user = user;
	}

	private String user;
	

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
