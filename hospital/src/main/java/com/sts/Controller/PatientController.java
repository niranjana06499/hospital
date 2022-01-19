package com.sts.Controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sts.DbConn;
import com.sts.model.Patient;
import com.sts.service.PatientService;
@Controller
public class PatientController {
	@Autowired
	PatientService patservice;
	
	@GetMapping({"/","/index"})
	public String hello(@RequestParam(value="name", defaultValue = "Vismitha", required = true)String name,Model model) {
		model.addAttribute("name",name);
		return "index";
	}
	@PostMapping("/save")
	public String saveUser(@ModelAttribute("user") Patient user) {
		patservice.savePatient(user);
		return "redirect:/";
	}
	
	@GetMapping("/update/{id}")
	public String showFormForUpdate(@PathVariable ( value = "id") long id, Model model) {
		Patient user = patservice.getPatientById(id);
		model.addAttribute("user", user);
		return "update_user";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable (value = "id") int id) throws SQLException {
		DbConn db = new DbConn();
		db.deluser(id);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/addform", method = RequestMethod.POST)
	public String add() {
		return "adduser";
	}
	
	@GetMapping("/updateform")
	public String update() {
		return "updateform";
	}
	@RequestMapping(value="/saveuser", method = RequestMethod.POST)
	public String userregaction(@RequestParam(value="name")String name,
			@RequestParam(value="emailid")String email,
			@RequestParam(value="phone")String phone,
			@RequestParam(value="address")String address) throws SQLException {
		//int ph=Integer.parseInt(phone.trim());
	System.out.println("userregaction");
		DbConn db= new DbConn();
		System.out.println("userregaction");
		db.insertuser(name, email, phone, address);
		
		return "index";
	}
	@RequestMapping(value="/updateuseraction")
	public String editemployeeaction(@RequestParam(value="id")int id,
			@RequestParam(value="name")String name,
			@RequestParam(value="emailid")String email,
			@RequestParam(value="phone")String phone,
			@RequestParam(value="address")String address) throws SQLException {
		//int ph=Integer.parseInt(phone.trim());
		System.out.println("editemployeeaction");
		DbConn db= new DbConn();
		System.out.println("editemployeeaction");
		db.updateuser(id,name, email, phone, address);
		
		return "index";
	}
	@GetMapping("/addrecordform")
	public String addrecordform() {
		return "addrecordform";
	}
	
	@GetMapping("/addrecordnewform")
	public String addrecordnewform() {
		return "addrecordnewform";
	}
	@RequestMapping(value="/addrecordaction")
	public String addrecordaction(@RequestParam(value="id")int patientid,
			@RequestParam(value="date")String doc,
			@RequestParam(value="tablet")String tablet,
			@RequestParam(value="doctor")String doctor,
			@RequestParam(value="disease")String disease,
			@RequestParam(value="nextvisit")String nextvisit) throws SQLException {
		
		DbConn db= new DbConn();
		db.insertrecord(patientid, doc, tablet, doctor, disease, nextvisit);
		
		return "addrecordform";
	}

}
