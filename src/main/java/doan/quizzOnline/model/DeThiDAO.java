package doan.quizzOnline.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface DeThiDAO extends CrudRepository<DeThi, Long>{
	List<DeThi> findAll();
	DeThi findByidDeThi(Integer idDeThi);
}
