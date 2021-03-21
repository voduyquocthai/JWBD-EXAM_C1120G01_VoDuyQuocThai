package service;

import model.Product;

import java.util.List;

public interface ProductService {
    void insert(Product product);

    void edit(Product product);

    void delete(int id);

    Product get(int id);

    List<Product> getAll();

    List<Product> searchByName(String productName);
}
