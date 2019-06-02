package com.skilldistillery.discgolf.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.discgolf.entities.Address;
import com.skilldistillery.discgolf.repositories.AddressRepository;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	AddressRepository repo;
	

	@Override
	public List<Address> allAddresses() {
		return repo.findAll();
	}

	@Override
	public Address findById(int id) {
		Address address;
		Optional<Address> op = repo.findById(id);
		if(op.isPresent()) {
			address = op.get();
		}else {
			address = null;
		}
		return address;
	}

	@Override
	public Address create(Address address) {
		Address newAddress;
		if (address != null) {
			newAddress = repo.saveAndFlush(address);
		}else {
			newAddress = null;
		}
		return newAddress;
	}

	@Override
	public Address replace(int id, Address address) {
		Address changed;
		Optional<Address> op = repo.findById(id);
		if (op.isPresent()) {
			changed = op.get();
			changed.setCity(address.getCity());
			changed.setState(address.getState());
			changed.setStreet(address.getStreet());
		}
		return address;
	}

	@Override
	public Boolean deleteById(int id) {
		Optional<Address> op = repo.findById(id);
		if(op.isPresent()) {
			repo.deleteById(id);
			return true;
		}else {
		return false;
		}
	}

}
