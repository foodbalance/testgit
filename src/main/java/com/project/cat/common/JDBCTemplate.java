package com.project.cat.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

//싱글톤(SingleTon) 패턴 적용
//프로그램 구동내내 메모리에 해당 클래스 기능(메소드)들이
//딱 한번 기록되게 하는 패턴
//여러 클래스가 공유하게 하는 방식에 사용함
//클래스의 모든 멤버를 static 선언하면 됨
public class JDBCTemplate {
	
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
//		String user = "c##student2";
//		String passwd = "student2";
		
		try {
			//jdbc 설정값 저장된 파일 로드함
			prop.load(new FileReader("jdbc.properties"));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String passwd = prop.getProperty("password");
			
			Class.forName(driver);
			conn = DriverManager.getConnection(
					url, user, passwd);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed())
				rset.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
