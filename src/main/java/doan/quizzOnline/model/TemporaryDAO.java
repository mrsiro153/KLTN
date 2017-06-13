package doan.quizzOnline.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

//public interface TemporaryDAO {}
///*
public interface TemporaryDAO extends CrudRepository<Temporary, Long>{
	List<Temporary> findByIduserAndIdexam(String iduser,Integer idexam);
//*/
}
