package pl.wrryy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.wrryy.entity.*;
import pl.wrryy.repository.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Controller
@SessionAttributes({"user"})
@RequestMapping("/add")
public class AddController {

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
    public List<User> getUsers() {
        return userRepository.findAllByFullName();
    }

    @ModelAttribute("stats")
    public List<Status> getStats() {
        return statusRepository.findAll();
    }

    @PostMapping("/project")
    public String addProject(@Valid Project project, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            model.addAttribute("users", userRepository.findAllByFullName());
            return "panel/project";
        } else {
            User user = (User) session.getAttribute("user");
            String act = user.getFullName() + " created new Project \"" + project.getName() + "\" on " + project.getCreatedd();
            Activity.addActivity(act);
            projectRepository.save(project);
            return "redirect:/panel/project";
        }
    }

    @GetMapping("/editproject")
    public String editProject(@RequestParam int id, Model model) {
        model.addAttribute("tasks", taskRepository.findAllByProjectId(id));
        model.addAttribute("project", projectRepository.findOne(id));
        return "panel/tHatproject";
    }

    @PostMapping("/editproject")
    public String editProject(@Valid Project project, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("users", userRepository.findAllByFullName());
            return "panel/tHatproject";
        } else {
            projectRepository.save(project);
            return "redirect:/panel/project";
        }
    }

    @PostMapping("/task")
    public String addTask(@Valid Task task, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            model.addAttribute("users", userRepository.findAllByFullName());
            model.addAttribute("tasks", taskRepository.findAllByOrderByCreatedDesc());
            model.addAttribute("prios", priorityRepository.findAll());
            return "panel/task";
        } else {
            User user = (User) session.getAttribute("user");
            String act = user.getFullName() + " added task to \"" + task.getProject().getName() + "\" project on " + task.getCreatedd();
            Activity.addActivity(act);
            taskRepository.save(task);
            return "redirect:/panel/task";
        }
    }

    @GetMapping("/changestatus")
    public String changeTaskStatus(@RequestParam int id, @RequestParam int statusId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Status status = statusRepository.findOne(statusId);
        Task task = taskRepository.findOne(id);
        task.setStatus(status);
        taskRepository.save(task);

        String date = Arrays.toString(LocalDateTime.now().toString().split("T"));
        String act = user.getFullName() + " changed task " + task.getName() + " status to \"" + task.getStatus().getName() + "\" on " + date;
        Activity.addActivity(act);
        return "redirect:/panel/task";
    }

    @PostMapping("/user")
    public String addUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "panel/user";
        } else {
            userRepository.save(user);
            return "redirect:/panel/user";
        }
    }
}
