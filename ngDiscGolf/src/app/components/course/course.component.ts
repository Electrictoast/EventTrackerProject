import { CourseService } from './../../services/course.service';
import { Component, OnInit } from '@angular/core';
import { Course } from 'src/app/models/course';
import { Router, ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-course',
  templateUrl: './course.component.html',
  styleUrls: ['./course.component.css']
})
export class CourseComponent implements OnInit {

  courses: Course[] = [];

  newCourse: Course = new Course();

  selected = null;

  editCourse: Course = null;

  constructor(private coursesvc: CourseService, private route: ActivatedRoute) { }

  averageRating(course: Course) {
    let average = 0;
    course.ratings.forEach(element => {
      average += element.value;
    });
    average = average / course.ratings.length;
    return average;
  }

  updateCourse(course: Course) {
    this.coursesvc.update(course).subscribe(
      data => this.reload(),

      err => console.error('Observer got an error: ' + err)
    );
  }

  reload() {
    return this.coursesvc.index().subscribe(
      data => {
        this.courses = data;
      },

      err => console.error('Observer got an error: ' + err)
    );
  }

  ngOnInit() {
    if (!this.selected && this.route.snapshot.paramMap.get('id')) {
      this.coursesvc.show(parseInt(this.route.snapshot.paramMap.get('id'))).subscribe(
        data => {
          this.selected = data;
        },
        err => console.error('error!' + err)
      );

      // this.selected = this.courses[this.route.snapshot.paramMap.get('id')];
    } else {
    this.reload();
    }
    this.newCourse = new Course();
  }

  setEditCourse() {
    this.editCourse = Object.assign({}, this.selected);
  }

  delete(course: Course) {
    this.coursesvc.destroy(course).subscribe(
      data => {
        this.reload();
      },
      err => console.error('Observer got an error: ' + err)
    );
  }

}
