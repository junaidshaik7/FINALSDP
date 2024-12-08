package com.klef.jfsd.springboot.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.repository.ProjectRepository;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.MentorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class MentorController 
{
	@Autowired
	private MentorService mentorService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@GetMapping("/dashboard")
	public ModelAndView mentorDashboard(Principal principal) {
	    String email = principal.getName();
	    Mentor mentor = mentorService.findByEmail(email);

	    List<StudentProject> studentProjects = projectRepository.findByMentorId(mentor.getId());

	    ModelAndView mv = new ModelAndView("mentorDashboard");
	    mv.addObject("mentor", mentor);
	    mv.addObject("studentProjects", studentProjects);

	    return mv;
	}
	
	@GetMapping("viewallstudents")
    public ModelAndView viewallstudents()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> stulist = adminService.ViewAllStudents();
      mv.setViewName("viewallstudents");
      mv.addObject("stulist",stulist);
      return mv;
    }
	
	@GetMapping("mentorprofile")
	public ModelAndView mentorprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mentorprofile");
		return mv;
	}
	@GetMapping("updatementor")
	public ModelAndView updatementor()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatementor");
		return mv;
	}
	@PostMapping("updatementorprofile")
	public ModelAndView updateempprofile(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    try {
	        // Retrieving parameters from the request
	        int id = Integer.parseInt(request.getParameter("mid"));
	        String name = request.getParameter("mname");
	        String gender = request.getParameter("mgender");
	        String dob = request.getParameter("mdob");
	        String dept = request.getParameter("mdept");
	        String location = request.getParameter("mlocation");
	        String email = request.getParameter("memail");
	        String password = request.getParameter("mpwd");
	        String contact = request.getParameter("mcontact");
	        String status = request.getParameter("mstatus"); // Assuming 'status' is part of the form
	        
	        // Creating and setting Mentor object
	        Mentor mentor = new Mentor();
	        mentor.setId(id);
	        mentor.setName(name);
	        mentor.setGender(gender);
	        mentor.setDateOfBirth(dob);
	        mentor.setDepartment(dept);
	        mentor.setLocation(location);
	        mentor.setEmail(email);
	        mentor.setPassword(password);
	        mentor.setContact(contact);
	        mentor.setStatus(status); 
	        
	        
	        String msg = mentorService.updateMentorProfile(mentor);
	        
	        Mentor m = mentorService.displayMentorById(id);
	        HttpSession session = request.getSession();
	        session.setAttribute("mentor",m);
	        
	        
	        mv.setViewName("updatesuccess");
	        mv.addObject("message", msg);
	        
	    } catch (Exception e) {
	        mv.setViewName("updateerror");
	        mv.addObject("message", e.getMessage());
	    }
	    
	    return mv;
	}

	
	

}
