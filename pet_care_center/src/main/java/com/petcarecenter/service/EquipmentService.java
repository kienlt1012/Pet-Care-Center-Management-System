package com.petcarecenter.service;

import com.petcarecenter.entity.Equipment;

public interface EquipmentService {
	
	public Iterable<Equipment> findAll();
	
	public Equipment find(int id);
	
	public Equipment save(Equipment equipment);
	
	public void update(Equipment equipment);
	
	public void delete(int id);
}
