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
			String path = this.getClass().getClassLoader().getResource("/").getPath();//�õ�������WEB-INF/classes/·��
	        path=path.substring(1, path.indexOf("classes"));//��·���ַ�����ȡ������·��		
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
	 * �����ݿ�
	 */
	public void open() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(
					url, username, password);
			stmt = conn.createStatement();
			System.out.println("�����ݿ�����");
		} catch (Exception ex) {
			System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
		}
	}

	/**
	 * �ر����ݿ⣬�����ӷ��������ӳ�
	 */
	public void close() {
		try {
			conn.close();
			System.out.println("�ͷ�����");
		} catch (SQLException ex) {
			System.err.println("�������ӳس���: " + ex.getMessage());
		}
	}

	/**
	 * ִ�в�ѯ
	 */
	public ResultSet executeQuery(String sql) throws SQLException {
		ResultSet rs = null;

		rs = stmt.executeQuery(sql);
		System.out.println("ִ�в�ѯ");
		return rs;
	}

	/**
	 * ִ����ɾ��
	 */
	public int executeUpdate(String sql) throws SQLException {
		int ret = 0;

		ret = stmt.executeUpdate(sql);

		System.out.println("ִ����ɾ��");
		return ret;
	}

	/**
	 * ��SQL�����뵽������
	 */
	public void addBatch(String sql) throws SQLException {
		// �������� SQL������ӵ��� Statement����ĵ�ǰ�����б��С�ͨ�����÷� �� executeBatch
		// ��������ִ�д��б��е����
		stmt.addBatch(sql);
	}

	/**
	 * ִ��������
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
