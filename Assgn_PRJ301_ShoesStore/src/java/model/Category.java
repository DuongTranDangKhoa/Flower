package model;
public class Category {
    private Integer CategoryId;
    private String CategoryName;

    public Category(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public Category() {
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer CategoryId) {
        this.CategoryId = CategoryId;
    }

}
