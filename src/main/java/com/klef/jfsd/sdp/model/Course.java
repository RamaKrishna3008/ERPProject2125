package com.klef.jfsd.sdp.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="course_table")
public class Course
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int courseid;
  
  @Column(unique = true,nullable = false)
  private String coursecode;
  
  @Column(nullable = false)
  private String coursetitle;
  
  @Column(nullable = false)
  private String ltps;
  
  @Column(nullable = false)
  private double credits;
  
  @Column(nullable = false)
  private String forbatch;
  
  @Column(nullable = false)
  private String academicYear;
  
  @Column(nullable = false)
  private String offeredsem;
  

public String getForBatch() {
	return forbatch;
}

public void setForBatch(String forbatch) {
	this.forbatch = forbatch;
}

public int getCourseid() {
	return courseid;
}

public void setCourseid(int courseid) {
	this.courseid = courseid;
}

public String getCoursecode() {
	return coursecode;
}

public void setCoursecode(String coursecode) {
	this.coursecode = coursecode;
}

public String getCoursetitle() {
	return coursetitle;
}

public void setCoursetitle(String coursetitle) {
	this.coursetitle = coursetitle;
}

public String getLtps() {
	return ltps;
}

public void setLtps(String ltps) {
	this.ltps = ltps;
}

public double getCredits() {
	return credits;
}

public void setCredits(double credits) {
	this.credits = credits;
}

public String getAcademicYear() {
	return academicYear;
}

public void setAcademicYear(String academicYear) {
	this.academicYear = academicYear;
}

public String getOfferedsem() {
	return offeredsem;
}

public void setOfferedsem(String offeredsem) {
	this.offeredsem = offeredsem;
}
}
