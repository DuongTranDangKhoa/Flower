package model;
public class Product {
    private Integer ProductId;
    private String ProductName;
    private String Img;
    private Float Price;
    private String Description;
    private Integer CategoryId;

    public Product() {
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public Product(String ProductName, String Img, Float Price, String Description, Integer CategoryId) {
        this.ProductName = ProductName;
        this.Img = Img;
        this.Price = Price;
        this.Description = Description;
        this.CategoryId = CategoryId;
    }

    
    public Product(Integer ProductId, String ProductName, String Img, Float Price, String Description, Integer CategoryId) {
        this.ProductId = ProductId;
        this.ProductName = ProductName;
        this.Img = Img;
        this.Price = Price;
        this.Description = Description;
        this.CategoryId = CategoryId;
    }

    public Product(String ProductName, Float Price, String Description, Integer CategoryId) {
        this.ProductName = ProductName;
        this.Price = Price;
        this.Description = Description;
        this.CategoryId = CategoryId;
    }

    public Integer getProductId() {
        return ProductId;
    }

    public void setProductId(Integer ProductId) {
        this.ProductId = ProductId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public Float getPrice() {
        return Price;
    }

    public void setPrice(Float Price) {
        this.Price = Price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer CategoryId) {
        this.CategoryId = CategoryId;
    }
    
}
