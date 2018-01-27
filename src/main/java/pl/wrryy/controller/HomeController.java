package pl.wrryy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.wrryy.entity.Activity;
import pl.wrryy.entity.Project;
import pl.wrryy.repository.ProjectRepository;
import pl.wrryy.repository.UserRepository;

@Controller
@SessionAttributes({"user"})
public class HomeController {

    @Autowired
    ProjectRepository projectRepository;
    @Autowired
    UserRepository userRepository;

    @RequestMapping("/")
    public String home(Model model){
        model.addAttribute("projects", projectRepository.findTop5ByOrderByCreatedDesc());
        model.addAttribute("activities", Activity.getActivities());
        return "index";
    }

}
