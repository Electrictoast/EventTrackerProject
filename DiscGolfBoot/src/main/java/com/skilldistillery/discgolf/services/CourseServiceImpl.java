package com.skilldistillery.discgolf.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.discgolf.entities.Course;
import com.skilldistillery.discgolf.repositories.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	CourseRepository repo;

	@Override
	public List<Course> allCourses() {
		return repo.findAll();
	}

	@Override
	public Course findById(int id) {
		Course course;
		Optional<Course> op = repo.findById(id);
		if (op.isPresent()) {
			course = op.get();
			return course;
		} else {
			return null;

		}
	}

	@Override
	public Course create(Course course) {
		if (course != null) {
			repo.save(course);
			repo.flush();
			return course;
		} else {
			return null;
		}
	}

	@Override
	public Course replace(int id, Course course) {
		Course changed = null;
		Optional<Course> op = repo.findById(id);
		if (op.isPresent()) {
			changed = op.get();
			changed.setName(course.getName());
			changed.setLength(course.getLength());
			changed.setDescription(course.getDescription());
			if(course.getAddress() != null) {
				changed.setAddress(course.getAddress());
			}
			if(course.getAmmenities() != null) {
				changed.setAmmenities(course.getAmmenities());
			}
					
		}
		return changed;
	}

	@Override
	public Boolean deleteById(int id) {
		Optional<Course> op = repo.findById(id);
		if (op.isPresent()) {
			repo.deleteById(id);
			return true;
		}else {
			return false;
		}
	}

}
