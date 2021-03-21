package service;

import model.Category;

import java.util.List;

public interface CategoryService {

    Category get(int id);

    List<Category> getAll();
}
