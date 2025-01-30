package hw04_demoBDProject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface SqlConnection {



    default Connection SqlConnect() throws SQLException{

        String url = "jdbc:postgresql://localhost:8006/demoDB";
        String usr  = "usr";
        String psw = "pwd";


        return DriverManager.getConnection(url,usr,psw);

    }
    public ResultSet sqlStatement(Connection con, String sqlStatement) throws SQLException;
    public void sqlPreparedStatement(Connection con, String sqlStatement) throws SQLException;

}
