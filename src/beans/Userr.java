package beans;

public class Userr {
	private int id;
	private String name;
	private String user;
	private String location;
	private String decent;
	private int count;
	public Userr(int count) {
		super();
		this.count = count;
	}
	public Userr(int id, String name, String user,String location,String decent) {
		super();
		this.id = id;
		this.name = name;
		this.user = user;
		this.location = location;
		this.decent = decent;
	}
	
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDecent() {
		return decent;
	}

	public void setDecent(String decent) {
		this.decent = decent;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
