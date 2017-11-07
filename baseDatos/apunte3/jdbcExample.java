import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class jdbcExample {
    public static void main(String[] args) {
        Connection dbConnection = null;
        String url = "jdbc:postgresql://127.0.0.1:5432/prueba";
        String username = "nombreDeUsuario";
        String password = "1234";
        
        try {
            Class.forName("org.postgresql.Driver");
            dbConnection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
        }
        
        String queryString = "INSERT INTO persona VALUES(13242424555, 'Juan Perez')";
        Statement Query;
        
        try {
            Query = dbConnection.createStatement();
            Query.execute(queryString);
            Query.close();
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
        }
        
        
        queryString = "SELECT * FROM persona";
        ResultSet Result = null;
        
        try {
            Query = dbConnection.createStatement();
            Result = Query.executeQuery(queryString);
            
            while(Result.next()) {
                System.out.print(Result.getString(1) + " | " + Result.getString(2));
                System.out.println();
            }
            
            Query.close();
        } catch (Exception e) {
            System.out.println("ERROR: " + e);
        }
      }
}
