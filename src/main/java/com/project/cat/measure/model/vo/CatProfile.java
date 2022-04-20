package com.project.cat.measure.model.vo;

public class CatProfile implements java.io.Serializable{
	
	private static final long serialVersionUID = -112512630L;
	
	private String user_id;
	private String cat_name;
	private String breed;
	private int age;
	private String stature;
	private double weight;
	private String neutering;
	private String cat_original_img;
	private String cat_rename_img;
	private int repeat_number;
	private double measure_value;
	
	public CatProfile() {}
	
	public CatProfile(String user_id, String cat_name, String breed, int age, String stature, double weight,
			String neutering, String cat_original_img, String cat_rename_img, int repeat_number, double measure_value) {
		super();
		this.user_id = user_id;
		this.cat_name = cat_name;
		this.breed = breed;
		this.age = age;
		this.stature = stature;
		this.weight = weight;
		this.neutering = neutering;
		this.cat_original_img = cat_original_img;
		this.cat_rename_img = cat_rename_img;
		this.repeat_number = repeat_number;
		this.measure_value = measure_value;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getStature() {
		return stature;
	}

	public void setStature(String stature) {
		this.stature = stature;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getNeutering() {
		return neutering;
	}

	public void setNeutering(String neutering) {
		this.neutering = neutering;
	}

	public String getCat_original_img() {
		return cat_original_img;
	}

	public void setCat_original_img(String cat_original_img) {
		this.cat_original_img = cat_original_img;
	}

	public String getCat_rename_img() {
		return cat_rename_img;
	}

	public void setCat_rename_img(String cat_rename_img) {
		this.cat_rename_img = cat_rename_img;
	}

	public int getRepeat_number() {
		return repeat_number;
	}

	public void setRepeat_number(int repeat_number) {
		this.repeat_number = repeat_number;
	}

	public double getMeasure_value() {
		return measure_value;
	}

	public void setMeasure_value(double measure_value) {
		this.measure_value = measure_value;
	}

}
