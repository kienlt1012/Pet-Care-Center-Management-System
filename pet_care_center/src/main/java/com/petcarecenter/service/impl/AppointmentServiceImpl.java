package com.petcarecenter.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcarecenter.entity.Appointment;
import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;
import com.petcarecenter.repository.AppointmentRepository;
import com.petcarecenter.service.AppointmentService;

@Service("appointmentService")
public class AppointmentServiceImpl implements AppointmentService{
	
	private AppointmentRepository appointmentRepository;
	
	@Autowired   
	public AppointmentServiceImpl(AppointmentRepository obj) {
		appointmentRepository=obj;
	}

	@Override
	public List<Appointment> findAll() {
		return appointmentRepository.findAll();
	}

	@Override
	public Appointment find(int id) {
		return appointmentRepository.findOne(id);
	}
	
	@Override
	public void save(Appointment appointment) {
		appointmentRepository.save(appointment);
		
	}

	@Override
	public void delete(int id) {
		appointmentRepository.delete(id);
	}

	@Override
	public List<Appointment> findByUser(Iterable<Appointment> appointments, User user) {
		List<Appointment> filteredAppointment = new ArrayList<Appointment>();
		for(Appointment appointment : appointments) {
			if (user.getName().equals(appointment.getOwner())) {
				filteredAppointment.add(appointmentRepository.findOne(appointment.getId()));
			}
		}
		return filteredAppointment;
	}

	

}
