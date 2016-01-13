package com.util;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.activation.DataSource;

/**
 * @author HZW_922
 * 
 */
public class DBO {

	private Connection conn;
	private Statement stmt;
	private DataSource ds;
	private  String driver;
	private  String username;
	private  String password;
	private  String url;


	public DBO() {
		Properties p = new Properties();
		try {
			String path = this.getClass().getClassLoader().getResource("/").getPath();//得到工程名WEB-INF/classes/路径
	        path=path.substring(1, path.indexOf("classes"));//从路径字符串中取出工程路径		
			p.load(new FileInputStream(path+"dbconfig.properties"));
			driver = p.getProperty("driver");
			username = p.getProperty("username");
			password = p.getProperty("password");
			url = p.getProperty("url");
		} catch (Exception e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}

	/**
	 * 打开数据库
	 */
	public void open() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(
					url, username, password);
			stmt = conn.createStatement();
			System.out.println("打开数据库连接");
		} catch (Exception ex) {
			System.err.println("打开数据库时出错: " + ex.getMessage());
		}
	}

	/**
	 * 关闭数据库，将连接返还给连接池
	 */
	public void close() {
		try {
			conn.close();
			System.out.println("释放连接");
		} catch (SQLException ex) {
			System.err.println("返还连接池出错: " + ex.getMessage());
		}
	}

	/**
	 * 执行查询
	 */
	public ResultSet executeQuery(String sql) throws SQLException {
		ResultSet rs = null;

		rs = stmt.executeQuery(sql);
		System.out.println("执行查询");
		return rs;
	}

	/**
	 * 执行增删改
	 */
	public int executeUpdate(String sql) throws SQLException {
		int ret = 0;

		ret = stmt.executeUpdate(sql);

		System.out.println("执行增删改");
		return ret;
	}

	/**
	 * 将SQL语句加入到批处理
	 */
	public void addBatch(String sql) throws SQLException {
		// 将给定的 SQL命令添加到此 Statement对象的当前命令列表中。通过调用方 法 executeBatch
		// 可以批量执行此列表中的命令。
		stmt.addBatch(sql);
	}

	/**
	 * 执行批处理
	 */
	public int[] executeBatch() throws SQLException {
		boolean isAuto = conn.getAutoCommit();

		conn.setAutoCommit(false);
		int[] updateCounts = stmt.executeBatch();
		return updateCounts;
	}

	public boolean getAutoCommit() throws SQLException {
		return conn.getAutoCommit();
	}

	public void setAutoCommit(boolean auto) throws SQLException {
		conn.setAutoCommit(auto);
	}

	public void commit() throws SQLException {
		conn.commit();
	}

	public void rollBack() throws SQLException {
		conn.rollback();
	}
	
	
	public static void main(String[] args) {
		DBO dbo = new DBO(); 
	}

}
