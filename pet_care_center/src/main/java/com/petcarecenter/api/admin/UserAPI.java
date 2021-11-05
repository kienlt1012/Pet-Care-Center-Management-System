package com.petcarecenter.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.petcarecenter.entity.User;
import com.petcarecenter.service.UserService;

@RestController(value="userAPIOfAdmin")
@RequestMapping(value="api/user")
public class UserAPI {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="find_{id}" , method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> find(@PathVariable("id") int id) {
		try {
			return new ResponseEntity<User>(userService.find(id),HttpStatus.OK);
		} catch (Exception e){
			return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
		}
	}
}
