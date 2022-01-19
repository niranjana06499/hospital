package com.sts.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sts.model.Patient;
import com.sts.repository.PatientRepository;

@Service
public class PatientServiceImpl implements PatientService{
	
	@Autowired
	PatientRepository patrep;
	
	@Override
	public List<Patient> getAllPatient() {
		return (List<Patient>) patrep.findAll();
	}

	@Override
	public void savePatient(Patient user) {
		patrep.save(user);
	}

	@Override
	public Patient getPatientById(long id) {
		Optional<Patient > optional = patrep.findById(id);
		Patient  user = null;
		if (optional.isPresent()) {
			user = optional.get();
		} else {
			throw new RuntimeException(" Employee not found for id :: " + id);
		}
		return user;
	}

	@Override
	public void deletePatientById(long id) {
		this.patrep.deleteById(id);
	}

}
