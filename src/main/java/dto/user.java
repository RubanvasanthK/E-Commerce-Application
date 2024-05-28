package dto;

public class user {

	private String name;
	private String email;
	private long mobile;
	private String securityQuestion;
	private String answer;
	private String password;
	private String address;
	private String city;
	private String state;
	private String country;
	public user(String name, String email, long mobile, String securityQuestion, String answer, String password,
			String address, String city, String state, String country) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.password = password;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
	}
	public String getName() {
		return name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public long getMobile() {
		return mobile;
	}
	
	public String securityQuestion() {
		return securityQuestion;
	}
	
	public String getAnswer() {
		return answer;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getCity() {
		return city;
	}
	
	public String getState() {
		return state;
	}
	
	public String getCountry() {
		return country;
	}
	
	
	
}
