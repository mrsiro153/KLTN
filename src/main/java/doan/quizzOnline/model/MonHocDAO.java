package doan.quizzOnline.model;


import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface MonHocDAO extends CrudRepository<MonHoc, Long>{
	MonHoc findByidMonHoc(Integer idMonHoc);
	List<MonHoc> findAll();
}
