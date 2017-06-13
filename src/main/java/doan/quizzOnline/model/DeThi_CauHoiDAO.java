package doan.quizzOnline.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


public interface DeThi_CauHoiDAO extends CrudRepository<DeThi_CauHoi, Long> {
	List<DeThi_CauHoi> findByMaDeThi(DeThi maDeThi);
}
