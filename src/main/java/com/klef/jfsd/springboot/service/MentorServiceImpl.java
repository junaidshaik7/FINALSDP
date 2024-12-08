package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.MentorRepository;


@Service
public class MentorServiceImpl implements MentorService 
{

    @Autowired
    private MentorRepository mentorRepository;
	

    @Override
    public String mentorRegistration(Mentor mentor) {
        mentorRepository.save(mentor);
        return "Mentor Registered Successfully";
    }

    @Override
    public Mentor checkMentorLogin(String email, String password) {
        return mentorRepository.findByEmailAndPassword(email, password);
    }

    public String updateMentorProfile(Mentor mentor) 
	{
      Mentor m = mentorRepository.findById(mentor.getId()).get();
        
        m.setName(mentor.getName());
        m.setSalary(mentor.getSalary());
        m.setDateOfBirth(mentor.getDateOfBirth());
        m.setDepartment(mentor.getDepartment());
        m.setLocation(mentor.getLocation());
        m.setContact(mentor.getContact());
	    
	   mentorRepository.save(m);
	    
	    return "Mentor Updated Successfully";
		
	}

	@Override
	public Mentor displayMentorById(int mid) 
	{
		return mentorRepository.findById(mid).get();
		
	}

    @Override
    public List<Mentor> getAllMentors() {
        return mentorRepository.findAll();
    }

    @Override
    public String assignProjectToStudent(int mentorId, int studentId, int projectId) {
        // Logic to assign project to a student
        return "Project assigned successfully to student.";
    }
    
    public Mentor findByEmail(String email) {
        return mentorRepository.findByEmail(email);
    }
    
}

