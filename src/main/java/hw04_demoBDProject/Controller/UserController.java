package hw04_demoBDProject.Controller;

import hw04_demoBDProject.Service.User;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@AllArgsConstructor
@RestController
@RequestMapping("/users")
public class UserController {
    private final User usr;

    @GetMapping("/{username}")
    public String getUserByUsername(@PathVariable String username) throws SQLException {


        return usr.GetTopOneUser(username);


    }
    @GetMapping("/CreateUser")
    public String CreateUser(@RequestParam String lastName,@RequestParam String firstName,@RequestParam String login, @RequestParam String password,@RequestParam int active,@RequestParam int role) throws SQLException {
        if (usr.GetTopOneUser(login) != null)
        {
            return String.format("Пользователь с логином %s уже есть в системе.",login);
        }
        else {
            usr.insertUser(lastName, firstName, login, password, active, role);
            return String.format("Пользователь с логином %s создан.", login);
        }
    }

    @GetMapping("")
    public String getHelloWorld()  {

        return "Hello";

    }
}
