package com.skilldistillery.discgolf.services;

import java.util.List;

import com.skilldistillery.discgolf.entities.Address;
import com.skilldistillery.discgolf.entities.Course;

public interface AddressService {
	
	List<Address> allAddress();
	Course findById(int id);
	Course create(Address address);
	Course replace(int id , Address address);
	Boolean deleteById(int id);

}
