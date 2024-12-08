package com.klef.jfsd.springboot.service;

import java.util.List;

//import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentProject;


public interface AdminService 
{
	public List<Student> ViewAllStudents();
	public Admin checkadminlogin(String uname,String pwd);
	public String deleteStudent(int sid);
	public List<StudentProject> viewAllProjects();
	public StudentProject viewProjectByID(Long id);
	public Student getStudentById(int id);
	public String updateStudent(Student student);
	public List<Mentor> ViewAllMentors();
	public Mentor getMentorById(int id);
	public String updateMentor(Mentor mentor);
	
	
}