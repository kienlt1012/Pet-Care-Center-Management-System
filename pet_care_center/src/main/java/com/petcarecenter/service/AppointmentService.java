package com.petcarecenter.service;

import java.util.List;

import com.petcarecenter.entity.Appointment;
import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;

public interface AppointmentService {
	
	public List<Appointment> findAll();
	
	public Appointment find(int id);
	
	public void save(Appointment User);
	
	public void delete(int id);
	
	public List<Appointment> findByUser(Iterable<Appointment> appointments, User user);
}
