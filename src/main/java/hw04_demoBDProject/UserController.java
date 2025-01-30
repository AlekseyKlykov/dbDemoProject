package hw04_demoBDProject;

import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

@RestController
@RequestMapping("/users")
public class UserController {
    @GetMapping("/{username}")
    public String getUserByUsername(@PathVariable String username) throws SQLException {

        User usr = new User();
        return usr.GetTopOneUser(username);


    }
    @PostMapping("/CreateUser")
    public void CreateUser(@RequestParam String lastName,@RequestParam String firstName,@RequestParam String login, @RequestParam String password,@RequestParam int active,@RequestParam int role) throws SQLException {

        User usr = new User();
        usr.insertUser(lastName,firstName,login,password,active,role);
    }

    @GetMapping("")
    public String getHelloWorld()  {

        return "Hello";

    }
}
