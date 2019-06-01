package com.skilldistillery.discgolf.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.discgolf.entities.Course;

public interface CourseRepository extends JpaRepository<Course, Integer> {

}
