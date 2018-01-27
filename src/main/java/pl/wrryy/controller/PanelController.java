package pl.wrryy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.wrryy.entity.*;
import pl.wrryy.repository.*;

import java.util.List;

@Controller
@SessionAttributes({"user"})
@RequestMapping("/panel")
public class PanelController {

    @Autowired
    ProjectRepository projectRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    TaskRepository taskRepository;
    @Autowired
    StatusRepository statusRepository;
    @Autowired
    PriorityRepository priorityRepository;

    @ModelAttribute("users")
    public List<User> getUsers(Model model) {
        return userRepository.findAllByFullName();
    }
    @ModelAttribute("projects")
    public List<Project> getProjects(Model model) {
       return projectRepository.findAllByOrderByCreatedDesc();
    }
    @ModelAttribute("prios")
    public List<Priority> getPrios(Model model) {
       return priorityRepository.findAll();
    }

    @GetMapping("/project")
    public String showProjects(Model model) {
        model.addAttribute("project", new Project());
        return "panel/project";
    }

    @GetMapping("/task")
    public String showTasks(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("tasks", taskRepository.findAllByOrderByCreatedDesc());
        model.addAttribute("stats", statusRepository.findAll());
        return "panel/task";
    }
    @GetMapping("/user")
    public String showUsers(Model model){
        model.addAttribute("newuser", new User());
        return "panel/user";
    }
    @GetMapping("/status")
    public String showStatus(Model model){
        model.addAttribute("status", new Status());
        return "panel/status";
    }
    @GetMapping("/priority")
    public String showPriority(Model model){
        model.addAttribute("priority", new Priority());
        return "panel/priority";
    }
}
