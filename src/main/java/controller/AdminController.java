package controller;

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {

    CategoryService categoryService = new CategoryServiceImpl();
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add_product":
                showFormAddProduct(request, response);
                break;
            case "delete_product":
                showFormDeleteProduct(request, response);
                break;
            case "edit_product":
                showFormEditProduct(request, response);
                break;
            case "list_product":
                showAllProductList(request, response);
                break;
            case "search_product":
                searchProduct(request, response);
                break;
            default:
                showAllProductList(request, response);
                break;
        }
    }

    private void showAllProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.getAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View//ListProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormAddProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/AddProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/DeleteProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = productService.get(Integer.parseInt(request.getParameter("id")));
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/EditProduct.jsp");
        dispatcher.forward(request, response);
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyName = request.getParameter("search");
        List<Product> products = productService.searchByName(keyName);
        request.setAttribute("products",products);
        request.getRequestDispatcher("View/ListProduct.jsp").forward(request,response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add_product":
                addProduct(request, response);
                break;
            case "edit_product":
                editProduct(request, response);
                break;
            case "delete_product":
                deleteProduct(request, response);
                break;
            case "search_product":
                searchProduct(request, response);
                break;
            default:
                showAllProductList(request, response);
                break;
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product();
        product.setName(request.getParameter("name_product"));
        product.setPrice(Double.parseDouble(request.getParameter("price_product")));
        product.setQuantity(Integer.parseInt(request.getParameter("quantity_product")));
        product.setColor(request.getParameter("color_product"));
        product.setDes(request.getParameter("des_product"));
        product.setCategory(categoryService.get(Integer.parseInt(request.getParameter("category"))));
        productService.insert(product);
        response.sendRedirect("admin?ac=list_product");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name_product"));
        product.setPrice(Double.parseDouble(request.getParameter("price_product")));
        product.setQuantity(Integer.parseInt(request.getParameter("quantity_product")));
        product.setColor(request.getParameter("color_product"));
        product.setDes(request.getParameter("des_product"));
        product.setCategory(categoryService.get(Integer.parseInt(request.getParameter("category"))));
        productService.edit(product);
        response.sendRedirect( "admin?ac=list_product");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        response.sendRedirect("admin?ac=list_product");
    }

}
