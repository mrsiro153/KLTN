package doan.quizzOnline.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface NoiDungDAO extends CrudRepository<NoiDung, Long> {
	List<NoiDung> findByIdMonHoc(MonHoc idMonHoc);
	NoiDung findByIdNoiDung(Integer idNoiDung);
}
