package doan.quizzOnline.model;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Transactional
@Repository
public interface QuyenDAO extends CrudRepository<Quyen, Long> {
	Quyen findById(int id);
}
