package com.petcarecenter.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.petcarecenter.entity.Equipment;

@Repository("equipmentRepository")
public interface EquipmentRepository extends JpaRepository<Equipment, Integer> {
	
}
