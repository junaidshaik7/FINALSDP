package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
//import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.MentorRepository;
import com.klef.jfsd.springboot.repository.ProjectRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private MentorRepository mentorRepository;
	
	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<Student> ViewAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public String deleteStudent(int sid) 
	{
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}

	@Override
	public List<StudentProject> viewAllProjects() 
	{
		return (List<StudentProject>) projectRepository.findAll();
		
	}

	@Override
	public StudentProject viewProjectByID(Long id) 
	{
		return projectRepository.findById(id).get();
	}
	public Student getStudentById(int id) {
	    return studentRepository.findById(id).orElse(null);
	}

	@Override
	public String updateStudent(Student student) {
	    studentRepository.save(student);
	    return "Student Updated Successfully";
	}

	@Override
	public List<Mentor> ViewAllMentors() 
	{
		return mentorRepository.findAll();
	}

	@Override
	public Mentor getMentorById(int id) {
		return mentorRepository.findById(id).orElse(null);
	}

	@Override
	public String updateMentor(Mentor mentor) {
		mentorRepository.save(mentor);
	    return "Mentor Updated Successfully";
	}
	
	
}