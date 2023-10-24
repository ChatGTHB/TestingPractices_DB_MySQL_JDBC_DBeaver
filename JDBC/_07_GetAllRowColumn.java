package jdbc;

import org.testng.annotations.Test;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class _07_GetAllRowColumn extends JDBCParent {

    @Test
    public void test01() throws SQLException {

        ResultSet result = statement.executeQuery("select city_id, city, country_id from city");

        result.last(); // I have gone to last row

        String stringID = result.getString(1); // The last row and first column --> city_id
        System.out.println("String ID = " + stringID);

        int intID = result.getInt(1); // If the field type is suitable, conversion can also be made to int type.
        System.out.println("int ID = " + intID); // The last row and first column --> city_id
    }

    @Test
    public void test02() throws SQLException {

        ResultSet result = statement.executeQuery("select * from city");

        ResultSetMetaData resultSetMetaData = result.getMetaData(); // Other non-data information


    }
}
