package hw04_demoBDProject.Service;


import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class User {

    private final java.util.List<sUser> usr = new ArrayList<>();

    public void GetAllUser() throws SQLException {
        PostgreSQL pg = new PostgreSQL();
       ResultSet res = pg.sqlStatement(pg.getCon(),"Select * from public.User");
        if(res.next()) {
            sUser setParam = new sUser();
            setParam.usr_id = res.getInt(1);
            setParam.usr_lastName = res.getString(2);
            setParam.usr_firstName = res.getString(3);
            setParam.usr_login = res.getString(4);
            setParam.usr_password = res.getString(5);
            setParam.usr_role = res.getInt(6);
            setParam.usr_role = res.getInt(8);

            usr.add(setParam);




        }
        res.close();
    }
    public String GetTopOneUser(String usr) throws SQLException {
        PostgreSQL pg = new PostgreSQL();

       ResultSet res = pg.sqlStatement(pg.getCon(),String.format("Select  * from public.\"User\" where usr_login = \'%s\' ORDER BY usr_id DESC LIMIT 1;" ,usr));
if(res.next())
{
    return String.format("ИД: %s, Фамилия: %s, Имя: %s, Логин: %s, Пароль: %s, Активный: %s\n\n\n",res.getString(1)
            ,res.getString(2)
            ,res.getString(3)
            ,res.getString(4)
            ,res.getString(5)
            ,res.getString(6)

    );

}
       res.close();
return null;
    }

    public void insertUser(String lastName,String firstName,String login,String password,int active,int role) throws SQLException {

        PostgreSQL pg = new PostgreSQL();
        pg.sqlPreparedStatement(pg.getCon(),String.format("insert into public.\"User\"(\"usr_lastName\",\"usr_firstName\", \"usr_login\", \"usr_password\",\"usr_active\", \"usr_role\") values(\'%s\',\'%s\',\'%s\',\'%s\',%s,%s)",lastName,firstName,login,password,active,role));

    };

    private static class sUser{



        int usr_id;
        String usr_firstName;
        String usr_lastName;
        String usr_login;
        String usr_password;
        int usr_active;
        int usr_role;





    }

}
