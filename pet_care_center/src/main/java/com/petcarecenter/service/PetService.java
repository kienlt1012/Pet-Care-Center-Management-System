package com.petcarecenter.service;

import java.util.List;

import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;

public interface PetService {
	
	public Iterable<Pet> findAll();
	
	public Pet find(int id);
	
	public Pet save(Pet pet);
	
	public void delete(int id);
	
	public List<Pet> findByUser(Iterable<Pet> pets, User user);
	
	public List<Pet> findByTreatment(Iterable<Pet> pets);
	
	public List<Pet> findByService(Iterable<Pet> pets);
}
