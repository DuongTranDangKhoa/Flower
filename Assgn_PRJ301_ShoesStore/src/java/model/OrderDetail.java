package model;
public class OrderDetail {
    private Integer OrderDetailId;
    private Integer OrderId;
    private Integer ProductId;
    private Integer quantity;
    private Float Price;

    public OrderDetail() {
    }

    public OrderDetail(Integer ProductId, Integer quantity, Float Price) {
        this.ProductId = ProductId;
        this.quantity = quantity;
        this.Price = Price;
    }

    public Integer getOrderDetailId() {
        return OrderDetailId;
    }

    public void setOrderDetailId(Integer OrderDetailId) {
        this.OrderDetailId = OrderDetailId;
    }

    
    public OrderDetail(Integer OrderId, Integer ProductId, Integer quantity, Float Price) {
        this.OrderId = OrderId;
        this.ProductId = ProductId;
        this.quantity = quantity;
        this.Price = Price;
    }

    public Integer getOrderId() {
        return OrderId;
    }

    public void setOrderId(Integer OrderId) {
        this.OrderId = OrderId;
    }

    public Integer getProductId() {
        return ProductId;
    }

    public void setProductId(Integer ProductId) {
        this.ProductId = ProductId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return Price;
    }

    public void setPrice(Float Price) {
        this.Price = Price;
    }
    
}
