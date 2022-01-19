package com.sts.service;

import java.util.List;

import com.sts.model.Patient;


public interface PatientService {
	List<Patient> getAllPatient();
	void savePatient(Patient user);
	Patient getPatientById(long id);
	void deletePatientById(long id);
}
