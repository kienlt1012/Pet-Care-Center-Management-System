package com.petcarecenter.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.petcarecenter.entity.Equipment;
import com.petcarecenter.service.EquipmentService;

@RestController(value="equipmentAPIOfAdmin")
@RequestMapping(value="api/equipment")
public class EquipmentAPI {
	@Autowired
	private EquipmentService equipmentService;
	
	@RequestMapping(value="find_{id}" , method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Equipment> find(@PathVariable("id") int id) {
		try {
			return new ResponseEntity<Equipment>(equipmentService.find(id),HttpStatus.OK);
		} catch (Exception e){
			return new ResponseEntity<Equipment>(HttpStatus.BAD_REQUEST);
		}
	}
}


