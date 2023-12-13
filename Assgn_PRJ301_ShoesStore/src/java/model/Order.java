package model;

import java.util.Date;

public class Order {
    private Integer OrderId;
    private String Username;
    private Date OrderDate;
    private Float Total;

    public Order() {
    }

    public Integer getOrderId() {
        return OrderId;
    }

    public void setOrderId(Integer OrderId) {
        this.OrderId = OrderId;
    }

    public Order(String Username, Date OrderDate, Float Total) {
        this.Username = Username;
        this.OrderDate = OrderDate;
        this.Total = Total;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public Float getTotal() {
        return Total;
    }

    public void setTotal(Float Total) {
        this.Total = Total;
    }
    
}
