package hw04_demoBDProject;

import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonEnumDefaultValue;
import lombok.Data;
import lombok.Value;

import java.sql.*;

@Data
public class PostgreSQL implements SqlConnection {

private Connection con = null;

public PostgreSQL() throws SQLException {
    if(con == null)
    {
        con = SqlConnect();

        System.out.println(con);

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
