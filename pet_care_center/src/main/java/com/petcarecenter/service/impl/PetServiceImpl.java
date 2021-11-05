package com.petcarecenter.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;
import com.petcarecenter.repository.PetCRUDRepository;
import com.petcarecenter.service.PetService;

@Service("petService")
public class PetServiceImpl implements PetService {

	@Autowired
	private PetCRUDRepository petCRUDRepository;
	
	@Override
	public Iterable<Pet> findAll() {
		return petCRUDRepository.findAll();
	}

	@Override
	public Pet find(int id) {
		return petCRUDRepository.findOne(id);
	}

	@Override
	public Pet save(Pet pet) {
		return petCRUDRepository.save(pet);
	}

	@Override
	public void delete(int id) {
		petCRUDRepository.delete(id);
	}

	@Override
	public List<Pet> findByUser(Iterable<Pet> pets, User user) {
		List<Pet> filteredPet = new ArrayList<Pet>();
		for(Pet pet : pets) {
			if (user.getName().equals(pet.getOwner())) {
				filteredPet.add(petCRUDRepository.findOne(pet.getId()));
			}
		}
		return filteredPet;
	}

	@Override
	public List<Pet> findByTreatment(Iterable<Pet> pets) {
		List<Pet> filteredPet = new ArrayList<Pet>();
		for(Pet pet : pets) {
			if (!pet.getTreatment().equals("")) {
				filteredPet.add(petCRUDRepository.findOne(pet.getId()));
			}
		}
		return filteredPet;
	}

	@Override
	public List<Pet> findByService(Iterable<Pet> pets) {
		List<Pet> filteredPet = new ArrayList<Pet>();
		for(Pet pet : pets) {
			if (!pet.getService().equals("")) {
				filteredPet.add(petCRUDRepository.findOne(pet.getId()));
			}
		}
		return filteredPet;
	}

}

