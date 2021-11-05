package com.petcarecenter.api.staff;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.petcarecenter.entity.Pet;
import com.petcarecenter.service.PetService;

@RestController(value="petAPIOfVet")
@RequestMapping(value="api/pet")
public class PetAPI {
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="find_{id}" , method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Pet> find(@PathVariable("id") int id) {
		try {
			return new ResponseEntity<Pet>(petService.find(id),HttpStatus.OK);
		} catch (Exception e){
			return new ResponseEntity<Pet>(HttpStatus.BAD_REQUEST);
		}
	}
}

