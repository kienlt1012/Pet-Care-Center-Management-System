package com.petcarecenter.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.petcarecenter.entity.User;
import com.petcarecenter.entity.login.UserEntity;
import com.petcarecenter.entity.login.RoleEntity;
import com.petcarecenter.repository.UserCRUDRepository;
import com.petcarecenter.repository.login.RoleRepository;
import com.petcarecenter.repository.login.UserRepository;
import com.petcarecenter.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserCRUDRepository userCRUDRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Iterable<User> findAll() {
		return userCRUDRepository.findAll();
	}

	@Override
	public User find(int id) {
		return userCRUDRepository.findOne(id);
	}

	@Override
	public void hash(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));		
	}
	
	@Override
	public User save(User user) {
		return userCRUDRepository.save(user);
	}

	@Override
	public void delete(int id) {
		userCRUDRepository.delete(id);
	}

	@Override
	public void hash(UserEntity userEntity) {
		userEntity.setPassword(bCryptPasswordEncoder.encode(userEntity.getPassword()));	
	}

	@Override
	public User update(User user) {
		return userCRUDRepository.save(user);

	}

	@Override
	public void bindRole(User user) {
		UserEntity userEntity = new UserEntity();
		userEntity.setId(user.getId());
		userEntity.setName(user.getName());
		userEntity.setRole(user.getRole());
		userEntity.setPhone(user.getPhone());
		userEntity.setEmail(user.getEmail());
		userEntity.setAddress(user.getAddress());
		userEntity.setUsername(user.getUsername());
		userEntity.setPassword(user.getPassword());
		RoleEntity roleEntity = new RoleEntity();
		roleEntity.setRole(user.getRole());
		
		userEntity.getRoles().add(roleEntity);
		userRepository.save(userEntity);
	}
	
	@Override
	public void deleteRole(User user) {
		UserEntity userEntity = new UserEntity();
		userEntity.setId(user.getId());
		userEntity.setName(user.getName());
		userEntity.setRole(user.getRole());
		userEntity.setPhone(user.getPhone());
		userEntity.setEmail(user.getEmail());
		userEntity.setAddress(user.getAddress());
		userEntity.setUsername(user.getUsername());
		userEntity.setPassword(user.getPassword());
		RoleEntity roleEntity = new RoleEntity();
		roleEntity.setRole(user.getRole());
		
		userEntity.getRoles().remove(roleEntity);
		userRepository.delete(userEntity);
	}

	

}
