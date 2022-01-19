package com.sts.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sts.model.Patient;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long>{

}
