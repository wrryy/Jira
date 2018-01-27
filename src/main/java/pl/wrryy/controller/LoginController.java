package pl.wrryy.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import pl.wrryy.entity.User;
import pl.wrryy.repository.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@SessionAttributes("user")
public class LoginController {
    @Autowired
    UserRepository userRepository;

    @GetMapping(path = "/login")
    public String showLoginForm() {
        return "user/login";
    }

    @PostMapping(path = "/login")
    public String processLoginRequest(@RequestParam("userName") String username,
                                      @RequestParam("password") String password, Model model, HttpSession session) {

        User user = userRepository.findUserByUserNameEquals(username);

        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            session.setAttribute("user", user);
            return "redirect:/panel/project";
        } else {
            return "user/login";
        }
    }

    @GetMapping(path = "/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "user/register";
    }

    @PostMapping(path = "/register")
    public String processRegistrationRequest(@Valid User user, BindingResult result) {

        if (result.hasErrors()) {
            return "user/register";

        } else {
            userRepository.save(user);
            return "redirect:/";
        }
    }
    @GetMapping(path = "/logout")
    public String logut(HttpSession session, SessionStatus sessionStatus) {
        session.removeAttribute("user");
        sessionStatus.setComplete();
        return "redirect:/";
    }

}
