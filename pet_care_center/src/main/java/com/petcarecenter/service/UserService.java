package com.petcarecenter.service;

import com.petcarecenter.entity.User;
import com.petcarecenter.entity.login.UserEntity;

public interface UserService {
	
	public Iterable<User> findAll();
	
	public User find(int id);
	
	public void hash(User User);
	
	public void hash(UserEntity userEntity);
	
	public User save(User User);
	
	public User update(User User);
	
	public void delete(int id);
	
	public void bindRole(User User);
	
	public void deleteRole(User user);

}
