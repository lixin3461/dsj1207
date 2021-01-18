package com.offcn.dao;

import com.offcn.bean.Product;

import java.util.List;

public interface ProductDao {
    public List<Product> findAllProductByState(int state);

    public Product findProductById(int id);


}
