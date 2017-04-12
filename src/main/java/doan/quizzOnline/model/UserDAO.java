package doan.quizzOnline.model;



import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

public interface UserDAO extends CrudRepository<User, Long>{
	User findByIdAndQuyen(String id,Quyen quyen);
	User findById(String id);
	List<User> findAll();
	//
	@Transactional
    Long deleteById(String id);
}
