package doan.quizzOnline.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface User_DeThiDAO extends CrudRepository<User_DeThi, Long> {
	public User_DeThi findBymaSinhVienAndMaDeThi(User maSinhVien,DeThi maDeThi); 
	public List<User_DeThi> findBymaSinhVien(User maSinhVien);
	public List<User_DeThi> findByMaDeThi(DeThi maDeThi);
}
