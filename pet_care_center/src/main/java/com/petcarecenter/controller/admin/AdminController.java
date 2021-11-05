package com.petcarecenter.controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

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
import com.petcarecenter.entity.User;
import com.petcarecenter.service.EquipmentService;
import com.petcarecenter.service.UserService;


@Controller(value = "AdminController")
public class AdminController {
 
	@Autowired
	private UserService userService;
	
	@Autowired
	private EquipmentService equipmentService;
	
// HOME CONTROLLER
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}

// PROFILE CONTROLLER
	
	@RequestMapping(value = "/admin/profile", method = RequestMethod.GET)
	public ModelAndView viewAdminProfile(ModelMap modelMap) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		int userId = myUser.getUserId();
		User user = userService.find(userId);		
				
		ModelAndView mav = new ModelAndView("admin/profile");
		modelMap.addAttribute("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/admin/edit_profile", method = RequestMethod.POST)
	public String editAdminProfile(HttpServletRequest request) {
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
		return "redirect:/admin/profile";
	}
	
//USER CONTROLLER
	@RequestMapping(value = "/admin/user_list", method = RequestMethod.GET)
	public ModelAndView viewUser(ModelMap modelMap) {
		modelMap.put("user", userService.findAll());
		ModelAndView mav = new ModelAndView("admin/user_list");
		return mav;
	}
	
	@Transactional
	@RequestMapping(value = "/admin/create_user", method = RequestMethod.POST)
	public String createUser(HttpServletRequest request) throws CloneNotSupportedException {		
		User user = new User();		
		user.setName(request.getParameter("name").trim());
		user.setRole(request.getParameter("role").trim());
		user.setPhone(request.getParameter("phone").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setAddress(request.getParameter("address").trim());
		user.setUsername(request.getParameter("username").trim());
		user.setPassword(request.getParameter("password").trim());		
		userService.hash(user);		
		userService.save(user);	
		userService.bindRole(user);
		return "redirect:/admin/user_list";
	}
	
	@RequestMapping(value = "/admin/delete_user", method = RequestMethod.POST)
	public String deleteUser(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.find(id);
		userService.deleteRole(user);
		//userService.delete(id);	
		
		return "redirect:/admin/user_list";
	}
	
	@RequestMapping(value = "/admin/edit_user", method = RequestMethod.POST)
	public String editUser(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.find(id);
		user.setName(request.getParameter("name").trim());
		user.setRole(request.getParameter("role").trim());
		user.setPhone(request.getParameter("phone").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setAddress(request.getParameter("address").trim());
		user.setUsername(request.getParameter("username").trim());
		user.setPassword(request.getParameter("password").trim());
		userService.hash(user);
		userService.save(user);
		return "redirect:/admin/user_list";
	}

//EQUIPMENT CONTROLLER
	
	@RequestMapping(value = "/admin/equipment_list", method = RequestMethod.GET)
	public ModelAndView viewAdminEquipment(ModelMap modelMap) {
		modelMap.put("equipment", equipmentService.findAll());
		ModelAndView mav = new ModelAndView("admin/equipment_list");
		return mav;
	}
	
	@RequestMapping(value = "/admin/create_equipment", method = RequestMethod.POST)
	public String createAdminEquipment(HttpServletRequest request) {
		Equipment equipment = new Equipment();
		equipment.setEqName(request.getParameter("eqName").trim());
		equipment.setQuantity(Integer.parseInt(request.getParameter("quantity").trim()));
		equipment.setInUse(Integer.parseInt(request.getParameter("inUse").trim()));
		equipment.setInStock(Integer.parseInt(request.getParameter("inStock").trim()));
		equipmentService.save(equipment);
		return "redirect:/admin/equipment_list";
	}
	
	@RequestMapping(value = "/admin/delete_equipment", method = RequestMethod.POST)
	public String deleteAdminEquipment(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		equipmentService.delete(id);
		return "redirect:/admin/equipment_list";
	}
	
	@RequestMapping(value = "/admin/edit_equipment", method = RequestMethod.POST)
	public String editAdminEquipment(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Equipment equipment = equipmentService.find(id);
		equipment.setEqName(request.getParameter("eqName").trim());
		equipment.setQuantity(Integer.parseInt(request.getParameter("quantity").trim()));
		equipment.setInUse(Integer.parseInt(request.getParameter("inUse").trim()));
		equipment.setInStock(Integer.parseInt(request.getParameter("inStock").trim()));
		equipmentService.save(equipment);
		return "redirect:/admin/equipment_list";
	}
	
	


}
