package com.petcarecenter.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.petcarecenter.dto.MyUser;
import com.petcarecenter.entity.login.RoleEntity;
import com.petcarecenter.entity.login.UserEntity;
import com.petcarecenter.repository.login.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUsername(username);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User "+ username +" not found!");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getRole()));
		}
		MyUser myUser = new MyUser(userEntity.getUsername(), userEntity.getPassword(), 
							true, true, true, true, authorities, userEntity.getId());
		myUser.setName(userEntity.getName());
		myUser.setAddress(userEntity.getAddress());
		myUser.setEmail(userEntity.getEmail());
		myUser.setPhone(userEntity.getPhone());
		return myUser;
	}

}
