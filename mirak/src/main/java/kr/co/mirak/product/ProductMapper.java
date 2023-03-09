package kr.co.mirak.product;

import java.util.List;


public interface ProductMapper {
	List<ProductVO> productList(ProductVO vo);
	
	List<ProductVO> productList1(Criteria cri);

	List<ProductVO> productList2(Criteria cri);
	
	List<ProductVO> productList3(Criteria cri);
	
	void insertProduct(ProductVO vo);

	ProductVO productDetail(ProductVO vo);

	void updateProduct(ProductVO vo);

	void deleteProduct(ProductVO vo);
	
	public List<ProductVO> getListPaging(ProductVO cri);

	/* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 목록(페이징 적용) */
    public List<ProductVO> getListPaging(Criteria cri);
	

}
