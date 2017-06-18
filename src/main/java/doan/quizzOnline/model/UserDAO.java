package doan.quizzOnline.model;



import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserDAO extends CrudRepository<User, Long>{
	User findByIdAndQuyen(String id,Quyen quyen);
	User findById(String id);
	List<User> findAll();
	//
	@Transactional
    Long deleteById(String id);
	
	List<User> findByLopAndQuyen(String lop,Quyen quyen);
	
	@Query(value = "SELECT quizz.user.lop FROM quizz.user where quizz.user.quyen=2 group by quizz.user.lop",nativeQuery=true)
	List<String> findByQuyenAndGroupByClass();
	
	@Query(value = "SELECT * FROM quizz.user where quizz.user.quyen=2 and quizz.user.lop = :lop ",nativeQuery=true)
	List<User> findByQuyenAndClassOfStudent(@Param("lop") String lop);
}
