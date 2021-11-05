package com.petcarecenter.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.petcarecenter.entity.User;

@Repository("userCRUDRepository")
public interface UserCRUDRepository extends CrudRepository<User, Integer> {

}
