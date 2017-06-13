package doan.quizzOnline.model;

import org.springframework.data.repository.CrudRepository;

public interface ChiTietCauHoiDAO extends CrudRepository<ChiTietCauHoi, Long>{
	public ChiTietCauHoi findByMaCauHoi(Integer maCauHoi);
}
