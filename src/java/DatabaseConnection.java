
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class DatabaseConnection {
    
  public Connection con;
  public PreparedStatement pm;
  public ResultSet rs;
  public Statement stm;
    
    public DatabaseConnection(){
        
    }
    @SuppressWarnings("CallToThreadDumpStack")
    public Connection setConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue_pumpkin", "root", "");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
    public ResultSet getResult (String query, Connection con){
        this.con =con;
        try{
       stm = con.createStatement();
       rs = stm.executeQuery(query);
        }catch(Exception e){
        e.printStackTrace();
        }
        return rs;
    }
    
    
}
