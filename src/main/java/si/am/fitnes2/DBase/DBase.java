package si.am.fitnes2.DBase;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBase {
	
	private static DBase DBase;
	
	public synchronized static DBase getInstance(){
		if(DBase == null){
			DBase =new DBase();
		}
		return DBase;
	}
	
	public Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/fitnes");
			return ds.getConnection();
		}
		catch (SQLException | NullPointerException | NamingException e) {
			System.err.println("Izjema!001");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
    }
}