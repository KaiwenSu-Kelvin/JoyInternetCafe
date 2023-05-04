package com.kelvin.joyinternetcafe.service;

import com.kelvin.joyinternetcafe.domain.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProduct();
    void modifyProduct(Product product);
    void addNewProduct(Product product);
}
