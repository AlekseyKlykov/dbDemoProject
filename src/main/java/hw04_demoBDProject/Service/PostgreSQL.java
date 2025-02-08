package hw04_demoBDProject.Service;

import hw04_demoBDProject.SqlConnection;
import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.sql.*;

@Data

public class PostgreSQL implements SqlConnection {

private static Connection con = null;
private static PostgreSQL pgSql = null;
private PostgreSQL() throws SQLException {
    if(con == null)
    {
        con = SqlConnect();



    }
}
public static PostgreSQL createPostgreSqlCon() throws SQLException {

    if(pgSql == null)
    {
        pgSql = new PostgreSQL();



    }
    return pgSql;


}
    @Override
    public ResultSet sqlStatement( String sqlStatement) throws SQLException {
        Statement st = this.con.createStatement();
        return st.executeQuery(sqlStatement);



    }

    @Override
    public void sqlPreparedStatement( String sqlStatement) throws SQLException {
        PreparedStatement st = this.con.prepareStatement(sqlStatement);
        st.executeUpdate();
        st.close();

    }
}
