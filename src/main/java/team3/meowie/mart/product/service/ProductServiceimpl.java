package team3.meowie.mart.product.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName:ProductServiceimpl
 * Description:
 * Create:2023/4/30 下午 03:38
 */
public interface ProductServiceimpl {

    public void saveImage(MultipartFile imageFile) throws Exception;
}
