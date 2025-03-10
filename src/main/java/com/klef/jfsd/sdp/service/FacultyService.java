package com.klef.jfsd.sdp.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.sdp.model.Attendance;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.StudentCourseMapping;

public interface FacultyService 
{
	public Faculty CheckFacultyLogin(String username,String pwd);
	public String UpdateFacultyProfile(Faculty f);
	public List<FacultyCourseMapping> findFacultyCoursesAndSections(int fid, String acadmicYear, String offeredsem);
	public List<StudentCourseMapping> findStudentsByFacultyId(int fid, int cid, int section);
	public String AddMaterials(FacultyStudentCourseMaterials materials);
	public String PostAttendance(Map<Integer, Attendance> att);
	public String UpdateInternals(StudentCourseMapping scm);
	public StudentCourseMapping findSCMById(int id);
	public Faculty viewFacultyByUsername(String username);

}
