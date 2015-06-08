package model;


import javax.persistence.*;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(nullable=false)
	private String address;
	@Column(nullable=false)
	private Integer zipCode;
	@Column(nullable=false)
	private String city;
	@Column(nullable=false)
	private String state;

	/* Constructor */
	public Address(String address, Integer zipCode, String city, String state) {
		this.address = address;
		this.zipCode = zipCode;
		this.city = city;
		this.state = state;
	}
	
	public Address() {
		
	}

	/* Getters & Setters */
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
