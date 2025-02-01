package hw04_demoBDProject;

import hw04_demoBDProject.Service.User;

import java.sql.SQLException;

public class tst {
    public static void main(String[] args) throws SQLException {

        User usr = new User();

        usr.insertUser("Kovalev","Evgeniy","e_covalev","ekovalev123",1,1);

    }
}
