package hw04_demoBDProject.Service;

import hw04_demoBDProject.SqlConnection;
import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.sql.*;

@Data

public class PostgreSQL implements SqlConnection {

private Connection con = null;

public PostgreSQL() throws SQLException {
    if(con == null)
    {
        con = SqlConnect();



    }
}
    @Override
    public ResultSet sqlStatement(Connection con, String sqlStatement) throws SQLException {
        Statement st = con.createStatement();
        return st.executeQuery(sqlStatement);



    }

    @Override
    public void sqlPreparedStatement(Connection con, String sqlStatement) throws SQLException {
        PreparedStatement st = con.prepareStatement(sqlStatement);
        st.executeUpdate();
        st.close();

    }
}
