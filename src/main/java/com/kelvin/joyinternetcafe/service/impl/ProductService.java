package com.kelvin.joyinternetcafe.service.impl;

import com.kelvin.joyinternetcafe.domain.Product;
import com.kelvin.joyinternetcafe.mapper.IProductMapper;
import com.kelvin.joyinternetcafe.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductService implements IProductService {

    @Autowired
    private IProductMapper productMapper;

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = productMapper.selectAllProduct();
        return products;
    }

    @Override
    public void modifyProduct(Product product) {
        productMapper.updateProduct(product);
    }

    @Override
    public void addNewProduct(Product product) {
        productMapper.insertNewProduct(product);
    }
}
