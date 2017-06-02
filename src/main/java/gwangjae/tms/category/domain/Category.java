package gwangjae.tms.category.domain;

public class Category {
	private int cat_id;
	private int gen_id;
	private int loc_id;
	private String cat_name;
	private int cat_use;
	
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public int getGen_id() {
		return gen_id;
	}
	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}
	public int getLoc_id() {
		return loc_id;
	}
	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public int getCat_use() {
		return cat_use;
	}
	public void setCat_use(int cat_use) {
		this.cat_use = cat_use;
	}
}
