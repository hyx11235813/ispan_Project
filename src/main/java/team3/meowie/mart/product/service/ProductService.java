package team3.meowie.mart.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import team3.meowie.mart.product.model.Category;
import team3.meowie.mart.product.model.Product;
import team3.meowie.mart.product.model.ProductRepository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * ClassName:ProductService
 * Description:
 * Create:2023/4/28 上午 11:12
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void addProduct(Product product) {

        productRepository.save(product);//save()方法是JpaRepository的方法
    }

    public Product findProductById(Integer id) {
        Optional<Product> option = productRepository.findById(id);

        if(option.isEmpty()) {
            return null;
        }

        return option.get();
    }

    public void deleteProductById(Integer id) {

        productRepository.deleteById(id);
    }

    public Page<Product> findByPage(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1, 6, Sort.Direction.DESC, "added");
        Page<Product> page = productRepository.findAll(pgb);
        return page;
    }

    public Page<Product> findByPageMain(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1, 6, Sort.Direction.DESC, "added");
        Page<Product> page = productRepository.findAll(pgb);
        return page;
    }



    @Transactional
    public Product  updateById(Product product) throws IOException {
        Optional<Product> option = productRepository.findById(product.getId());


        if(option.isPresent()) {
            Product oldproduct = option.get();
            oldproduct.setName(product.getName());
            oldproduct.setPrice(product.getPrice());
            oldproduct.setDescription(product.getDescription());
//            oldproduct.setCategory(product.getCategory());
            oldproduct.setAdded(product.getAdded());
            oldproduct.setCoverImage(product.getCoverImage());
            oldproduct.setQuantity(product.getQuantity());
            oldproduct.setCoverImage(product.getCoverImage());

return oldproduct;

        }
        return null;
    }



    public Product getLatest() {
        return productRepository.findFirstByOrderByAddedDesc();
    }


    public byte[] getProductById (Integer Id) {
        Optional<Product> option = productRepository.findById(Id);
        if (option.isPresent()) {
            Product product = option.get();
            return product.getCoverImage();
        } else return null;
    }

    //新增商品的類別
    public List<Category> getCategoryList() {
        List<Category> categoryList = new ArrayList<Category>();
        categoryList.add(new Category(1,"食品"));
        categoryList.add(new Category(2,"周邊"));
        return categoryList;
    }






}


