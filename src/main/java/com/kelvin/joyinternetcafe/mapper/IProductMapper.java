package com.kelvin.joyinternetcafe.mapper;

import com.kelvin.joyinternetcafe.domain.Product;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IProductMapper {
    List<Product> selectAllProduct();
    void updateProduct(Product product);
    void insertNewProduct(Product product);
}
