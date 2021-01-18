package com.offcn.service;

import com.offcn.bean.Product;

import java.util.List;

public interface ProductService {

    public List<Product> getAllProductByState(int state);

    public Product getProductById(int id);
}
