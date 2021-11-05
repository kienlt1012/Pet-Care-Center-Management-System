package com.petcarecenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcarecenter.entity.Equipment;
import com.petcarecenter.repository.EquipmentRepository;
import com.petcarecenter.service.EquipmentService;

@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService {

	@Autowired
	private EquipmentRepository equipmentRepository;
	
	@Override
	public Iterable<Equipment> findAll() {
		return equipmentRepository.findAll();
	}

	@Override
	public Equipment find(int id) {
		return equipmentRepository.findOne(id);
	}

	@Override
	public Equipment save(Equipment equipment) {
		return equipmentRepository.save(equipment);
	}

	@Override
	public void delete(int id) {
		equipmentRepository.delete(id);
	}

	@Override
	public void update(Equipment equipment) {
		equipment.setEqName(equipment.getEqName());
		equipment.setQuantity(equipment.getQuantity());
		equipment.setInUse(equipment.getInUse());
		equipment.setInStock(equipment.getInStock());		
	}

}
