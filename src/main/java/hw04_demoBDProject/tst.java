package hw04_demoBDProject;

import java.sql.SQLException;

public class tst {
    public static void main(String[] args) throws SQLException {

        User usr = new User();
        System.out.println(usr.GetTopOneUser("s_pupkin"));
    }
}
