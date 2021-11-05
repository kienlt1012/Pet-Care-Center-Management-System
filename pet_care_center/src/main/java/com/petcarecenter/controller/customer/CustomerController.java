package com.petcarecenter.controller.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.petcarecenter.dto.MyUser;
import com.petcarecenter.entity.Appointment;
import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;
import com.petcarecenter.service.AppointmentService;
import com.petcarecenter.service.PetService;
import com.petcarecenter.service.UserService;



@Controller(value = "homeControllerOfCustomer")
public class CustomerController {
	@Autowired
	private PetService petService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AppointmentService appointmentService;
	
//HOME CONTROLLER
	
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("customer/home");
		return mav;
	}

//PROFILE CONTROLLER
	
	@RequestMapping(value = "/customer/profile", method = RequestMethod.GET)
	public ModelAndView viewCustomerProfile(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);
		ModelAndView mav = new ModelAndView("customer/profile");
		modelMap.addAttribute("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/customer/edit_profile", method = RequestMethod.POST)
	public ModelAndView editCustomerProfile(HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		
		User user = userService.find(userId);
		user.setName(request.getParameter("name").trim());
		user.setPhone(request.getParameter("phone").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setAddress(request.getParameter("address").trim());
		user.setUsername(request.getParameter("username").trim());
		user.setPassword(request.getParameter("password").trim());
		userService.hash(user);
		userService.save(user);
		ModelAndView mav = new ModelAndView("redirect:/customer/profile");
		return mav;
	}
	
//PET CONTROLLER
	
	@RequestMapping(value = "/customer/pet_list", method = RequestMethod.GET)
	public String viewPetList(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);
		
		Iterable<Pet> pets = petService.findAll();		
		modelMap.put("pet", petService.findByUser(pets, user));
		return "customer/pet_list";
	}
	
//APPOINTMENT CONTROLLER
	
	@RequestMapping(value = "/customer/appointment_list", method = RequestMethod.GET)
	public ModelAndView viewAppointmentList(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);
		
		Iterable<Appointment> appointments = appointmentService.findAll();
		modelMap.put("appointment", appointmentService.findByUser(appointments, user));
		ModelAndView mav = new ModelAndView("customer/appointment_list");
		return mav;
	}
	
	@RequestMapping(value = "/customer/create_appointment", method = RequestMethod.POST)
	public String createAppointment(HttpServletRequest request) {		
		Appointment appointment = new Appointment();
		appointment.setPetName(request.getParameter("petName").trim());
		appointment.setOwner(request.getParameter("owner").trim());
		appointment.setType(request.getParameter("type").trim());
		appointment.setName(request.getParameter("name").trim());
		appointment.setDate(request.getParameter("date").trim());
		appointment.setTime(request.getParameter("time").trim());
		appointmentService.save(appointment);
		return "redirect:/customer/appointment_list";
	}
	
	@RequestMapping(value = "/customer/delete_appointment", method = RequestMethod.POST)
	public String deleteAppointment(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("Id is: " + id);
		appointmentService.delete(id);
		return "redirect:/customer/appointment_list";
	}
	
	@RequestMapping(value = "/customer/edit_appointment", method = RequestMethod.POST)
	public String editAppointment(HttpServletRequest request) {		
		int id = Integer.parseInt(request.getParameter("id"));
		Appointment appointment = appointmentService.find(id);
		appointment.setPetName(request.getParameter("petName").trim());
		appointment.setOwner(request.getParameter("owner").trim());
		appointment.setType(request.getParameter("type").trim());
		appointment.setName(request.getParameter("name").trim());
		appointment.setDate(request.getParameter("date").trim());
		appointment.setTime(request.getParameter("time").trim());
		appointmentService.save(appointment);
		return "redirect:/customer/appointment_list";
	}
	
}
