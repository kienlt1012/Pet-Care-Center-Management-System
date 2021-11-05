package com.petcarecenter.controller.vet;

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
import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;
import com.petcarecenter.service.AppointmentService;
import com.petcarecenter.service.PetService;
import com.petcarecenter.service.UserService;


@Controller(value = "vetController")
public class VetController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private AppointmentService appointmentService;

//HOME CONTROLLER
	
	@RequestMapping(value = "/vet", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("vet/home");
		return mav;
	}
	
// PROFILE CONTROLLER	
	
	@RequestMapping(value = "/vet/profile", method = RequestMethod.GET)
	public ModelAndView viewVetProfile(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);
		
		ModelAndView mav = new ModelAndView("vet/profile");
		modelMap.addAttribute("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/vet/edit_profile", method = RequestMethod.POST)
	public String editVetProfile(HttpServletRequest request) {
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
		return "redirect:/vet/profile";
	}
	
	@RequestMapping(value = "/vet/schedule", method = RequestMethod.GET)
	public ModelAndView viewSchedule() {
		ModelAndView mav = new ModelAndView("vet/schedule");
		return mav;
	}
	
//PATIENT CONTROLLER
	
	@RequestMapping(value = "/vet/patient_list", method = RequestMethod.GET)
	public ModelAndView viewPatientList(ModelMap modelMap) {		
		Iterable<Pet> pets = petService.findAll();	
		modelMap.put("pet", petService.findByTreatment(pets));
		ModelAndView mav = new ModelAndView("vet/patient_list");
		return mav;
	}
	
	@RequestMapping(value = "/vet/create_patient", method = RequestMethod.POST)
	public String createPatient(HttpServletRequest request) {		
		Pet pet = new Pet();
		pet.setName(request.getParameter("name").trim());
		pet.setOwner(request.getParameter("owner").trim());
		pet.setRace(request.getParameter("race").trim());
		pet.setAge(Double.parseDouble(request.getParameter("age").trim()));
		pet.setWeight(Double.parseDouble(request.getParameter("weight").trim()));
		pet.setGender(request.getParameter("gender").trim());
		pet.setTreatment(request.getParameter("treatment").trim());
		pet.setDate(request.getParameter("date").trim());
		petService.save(pet);
		return "redirect:/vet/patient_list";
	}
	
	@RequestMapping(value = "/vet/delete_patient", method = RequestMethod.POST)
	public String deletePatient(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		petService.delete(id);
		return "redirect:/vet/patient_list";
	}
	
	@RequestMapping(value = "/vet/edit_patient", method = RequestMethod.POST)
	public String editPatient(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Pet pet = petService.find(id);
		pet.setName(request.getParameter("name").trim());
		pet.setOwner(request.getParameter("owner").trim());
		pet.setRace(request.getParameter("race").trim());
		pet.setAge(Double.parseDouble(request.getParameter("age").trim()));
		pet.setWeight(Double.parseDouble(request.getParameter("weight").trim()));
		pet.setGender(request.getParameter("gender").trim());
		pet.setTreatment(request.getParameter("treatment").trim());
		pet.setDate(request.getParameter("date").trim());
		petService.save(pet);
		return "redirect:/vet/patient_list";
	}
	
	@RequestMapping(value = "/vet/payment", method = RequestMethod.GET)
	public ModelAndView viewPayment() {
		ModelAndView mav = new ModelAndView("vet/payment");
		return mav;
	}
	
//APPOINTMENT CONTROLLER

	@RequestMapping(value = "/vet/appointment", method = RequestMethod.GET)
	public ModelAndView viewAppointmentList(ModelMap modelMap) {
		modelMap.put("appointment", appointmentService.findAll());
		ModelAndView mav = new ModelAndView("staff/appointment_list");
		return mav;
	}
}
