package com.petcarecenter.controller.staff;

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
import com.petcarecenter.entity.Equipment;
import com.petcarecenter.entity.Pet;
import com.petcarecenter.entity.User;
import com.petcarecenter.service.AppointmentService;
import com.petcarecenter.service.EquipmentService;
import com.petcarecenter.service.PetService;
import com.petcarecenter.service.UserService;


@Controller(value = "staffController")
public class StaffController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private EquipmentService equipmentService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	
//HOME CONTROLLER
	
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("staff/home");
		return mav;
	}

// PROFILE CONTROLLER
	
	@RequestMapping(value = "/staff/profile", method = RequestMethod.GET)
	public ModelAndView viewStaffProfile(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);
		
		ModelAndView mav = new ModelAndView("vet/profile");
		modelMap.addAttribute("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/staff/edit_profile", method = RequestMethod.POST)
	public String editStaffProfile(HttpServletRequest request) {
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
		return "redirect:/staff/profile";
	}

	@RequestMapping(value = "/staff/schedule", method = RequestMethod.GET)
	public ModelAndView viewSchedule() {
		ModelAndView mav = new ModelAndView("staff/schedule");
		return mav;
	}

//PET CONTROLLER
	
	@RequestMapping(value = "/staff/pet_list", method = RequestMethod.GET)
	public ModelAndView viewPetList(ModelMap modelMap) {
		Iterable<Pet> pets = petService.findAll();	
		modelMap.put("pet", petService.findByService(pets));
		ModelAndView mav = new ModelAndView("staff/pet_list");
		return mav;
	}
	
	@RequestMapping(value = "/staff/create_pet", method = RequestMethod.POST)
	public String createPet(HttpServletRequest request) {		
		Pet pet = new Pet();
		pet.setName(request.getParameter("name").trim());
		pet.setOwner(request.getParameter("owner").trim());
		pet.setRace(request.getParameter("race").trim());
		pet.setAge(Double.parseDouble(request.getParameter("age").trim()));
		pet.setWeight(Double.parseDouble(request.getParameter("weight").trim()));
		pet.setGender(request.getParameter("gender").trim());
		pet.setService(request.getParameter("service").trim());
		petService.save(pet);
		return "redirect:/staff/pet_list";
	}
	
	@RequestMapping(value = "/staff/delete_pet", method = RequestMethod.POST)
	public String deletePet(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		petService.delete(id);
		return "redirect:/staff/pet_list";
	}
	
	@RequestMapping(value = "/staff/edit_pet", method = RequestMethod.POST)
	public String editPet(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Pet pet = petService.find(id);
		pet.setName(request.getParameter("name").trim());
		pet.setOwner(request.getParameter("owner").trim());
		pet.setRace(request.getParameter("race").trim());
		pet.setAge(Double.parseDouble(request.getParameter("age").trim()));
		pet.setWeight(Double.parseDouble(request.getParameter("weight").trim()));
		pet.setGender(request.getParameter("gender").trim());
		pet.setService(request.getParameter("service").trim());
		petService.save(pet);
		return "redirect:/staff/pet_list";
	}

//APPOINTMENT CONTROLLER

	@RequestMapping(value = "/staff/appointment", method = RequestMethod.GET)
	public ModelAndView viewAppointmentList(ModelMap modelMap) {
		modelMap.put("appointment", appointmentService.findAll());
		ModelAndView mav = new ModelAndView("staff/appointment_list");
		return mav;
	}
	
//EQUIPMENT CONTROLLER

	@RequestMapping(value = "/staff/equipment_list", method = RequestMethod.GET)
	public ModelAndView viewStaffEquipment(ModelMap modelMap) {
		modelMap.put("equipment", equipmentService.findAll());
		ModelAndView mav = new ModelAndView("staff/equipment_list");
		return mav;
	}
	
	@RequestMapping(value = "/staff/edit_equipment", method = RequestMethod.POST)
	public String editStaffEquipment(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Equipment equipment = equipmentService.find(id);
		equipment.setEqName(request.getParameter("eqName").trim());
		equipment.setQuantity(Integer. parseInt(request.getParameter("quantity").trim()));
		equipment.setInUse(Integer. parseInt(request.getParameter("inUse").trim()));
		equipment.setInStock(Integer. parseInt(request.getParameter("inStock").trim()));
		equipmentService.save(equipment);
		return "redirect:/staff/equipment_list";
	}
}
