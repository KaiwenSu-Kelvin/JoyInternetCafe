package com.kelvin.joyinternetcafe.domain;


/*
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(255)     | YES  |     | NULL    |                |
| price | decimal(10,2)    | YES  |     | NULL    |                |
+-------+------------------+------+-----+---------+----------------+
**/

public class Section {
    private int id;
    private String name;
    private double price;

    @Override
    public String toString() {
        return "Section{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
