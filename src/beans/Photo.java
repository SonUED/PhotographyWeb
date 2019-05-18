package beans;

public class Photo {
	private int id;
	private String name;
	private float price;
	private String des;
	public Photo(int id, String name, float price, String des) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.des = des;
	}
	public Photo(String name, float price, String des) {
		super();
		this.name = name;
		this.price = price;
		this.des = des;
	}
	
	public Photo(int id) {
		super();
		this.id = id;
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
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	
}	
