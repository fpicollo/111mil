import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class jdbcExample {
	public static void main(String[] args) {
		Connection dbConnection = null;
		
		String url = "jdbc:postgresql://127.0.0.1:5432/prueba";
		String username = "alumno";
		String password = "1234";
		
		try {
			Class.forName("org.postgresql.Driver");
			dbConnection = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		String queryString = "INSERT INTO persona VALUES(12345678, 'Juan Perez')";
		
		Statement query = null;
		
		try {
			query = dbConnection.createStatement();
			query.execute(queryString);
			query.close();
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		
		queryString = "SELECT * FROM persona";
		ResultSet result = null;
		
		try {
			query = dbConnection.createStatement();
			result = query.executeQuery(queryString);
			
			while(result.next()) {
				System.out.println(result.getString(1) + " | " + result.getString(2));
			}
			
			query.close();
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		try { dbConnection.close(); } catch(Exception e) {}
	}
}
