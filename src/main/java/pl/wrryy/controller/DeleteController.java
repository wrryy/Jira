package pl.wrryy.controller;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.wrryy.repository.*;

@Controller
@RequestMapping("/delete")
public class DeleteController {
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

    @GetMapping("/project")
    public String removeProject(@RequestParam int id) {
        try {
            projectRepository.delete(id);
        } catch (Exception e) {}
        return "redirect:/panel/project";
    }

    @GetMapping("/task")
    public String removeTask(@RequestParam int id) {
        taskRepository.delete(id);
        return "redirect:/panel/task";
    }

    @GetMapping("/user")
    public String removeUser(@RequestParam int id) {
        try {
            userRepository.delete(id);
        } catch (Exception e) {
        }
        return "redirect:/panel/user";
    }

    @GetMapping("/status")
    public String removeStatus(@RequestParam int id) {
        statusRepository.delete(id);
        return "redirect:/panel/status";
    }

    @GetMapping("/priority")
    public String removePriority(@RequestParam int id) {
        priorityRepository.delete(id);
        return "redirect:/panel/priority";
    }

}
