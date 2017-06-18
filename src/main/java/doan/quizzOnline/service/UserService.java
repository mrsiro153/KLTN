package doan.quizzOnline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;

@Service
public class UserService {

	public List<User> getAllUsers() {
		System.out.println(userDAO);
		return userDAO.findAll();
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public User saveNewUser(User user) {
		try {
			return userDAO.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public User getUserById(String idUser) {
		return userDAO.findById(idUser);
	}

	public void deleteUser(User user) {
		try {
			userDAO.deleteById(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("User can not delete because user have do the exam");
		}
	}

	@Autowired
	UserDAO userDAO;

}
