package bean.datebase;
 import java.sql.*;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public  class time_db {
	String DB_URL1;
	String USER ;
	String PASS;
	 Connection conn ;
     Statement stmt ;
     String last_time;
     String start_time;
	
	public time_db(){
		DB_URL1 = "jdbc:mysql://localhost:3306/video_time";   
		USER = "root";
	    PASS = "123456";
	
	           // 注册 JDBC 驱动
	           try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	       
	           // 打开链接
	           //out.println("连接数据库...");
	           try {
				conn = DriverManager.getConnection(DB_URL1,USER,PASS);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	           // 执行查询
	           //out.println(" 实例化Statement对...");
	           try {
				stmt = conn.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   

		
	}
	public Statement getStmt() {
		return stmt;
	}
	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}
	public String getDB_URL1() {
		return DB_URL1;
	}
	public void setDB_URL1(String dB_URL1) {
		DB_URL1 = dB_URL1;
	}
	public String getUSER() {
		return USER;
	}
	public void setUSER(String uSER) {
		USER = uSER;
	}
	public String getPASS() {
		return PASS;
	}
	public void setPASS(String pASS) {
		PASS = pASS;
	}
	public  Date get_last(String time) throws ParseException{
		SimpleDateFormat simFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return  simFormat.parse(time);	
		
	}
	public  String  get_last_time(){   
       return last_time;
}
	public  String  get_start_time(){   
	       return start_time;
	}
	public  boolean  insert(String s_t,String l_t) {
		boolean b=true;
			String sql="insert into  time values ('"+s_t+"','"+l_t+")";
			try {
				stmt.executeUpdate(sql);
				return b;
			
			     
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("未能添加成功！");
				return false;
			}
		
	}
	public boolean delete(String no) {
		String sql="delete from time where video_no ='"+no+"'";
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("删除失败！");
			return false;
		}
		return true;
		
	}
	public  boolean change(String no,String s_t,String l_t) {
		
	  	
		String sql="update  time set start_time ='"+s_t+"',last_time='"+l_t+"'where video_no='"+no+"'";
		try {
			stmt.executeUpdate(sql);
			System.out.println("设置成功！");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("设置失败！");
			return false;
		}
		return true;
		
	}
	
    
}
