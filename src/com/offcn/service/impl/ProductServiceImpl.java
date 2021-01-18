package com.offcn.service.impl;

import com.offcn.bean.Product;
import com.offcn.dao.ProductDao;
import com.offcn.dao.impl.ProductDaoImpl;
import com.offcn.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    ProductDao dao = new ProductDaoImpl();

    public List<Product> getAllProductByState(int state) {
        return dao.findAllProductByState(state);
    }

    @Override
    public Product getProductById(int id) {
        return dao.findProductById(id);
    }
}
