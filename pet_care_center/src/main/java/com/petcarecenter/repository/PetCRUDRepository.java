package com.petcarecenter.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.petcarecenter.entity.Pet;

@Repository("petCRUDRepository")
public interface PetCRUDRepository extends CrudRepository<Pet, Integer> {

}
