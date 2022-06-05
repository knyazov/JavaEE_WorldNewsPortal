package DBManager;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee_db?useUnicode=tru&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
