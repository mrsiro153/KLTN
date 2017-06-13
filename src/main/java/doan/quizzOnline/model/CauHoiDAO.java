package doan.quizzOnline.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface CauHoiDAO extends CrudRepository<CauHoi, Long> {
	CauHoi findByIdCauHoi(Integer idCauHoi);
	List<CauHoi> findAll();
	List<CauHoi> findByMaNoiDung(NoiDung maNoiDung);
	
}
