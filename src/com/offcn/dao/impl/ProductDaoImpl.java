package com.offcn.dao.impl;

import com.offcn.bean.Product;
import com.offcn.dao.ProductDao;
import com.offcn.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class ProductDaoImpl implements ProductDao {
    @Override
    public List<Product> findAllProductByState(int state) {
        List<Product> list = null;
        try{
            String sql = "select * from product where pro_state=?";
            QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
            list = qr.query(sql,new BeanListHandler<>(Product.class),state);
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product findProductById(int id) {
        Product p = null;
        try{
          String sql = "select * from product where pro_id=?";
          QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
          p = qr.query(sql,new BeanHandler<>(Product.class),id);
        }catch(Exception e){
            e.printStackTrace();
        }
        return p;
    }
}
