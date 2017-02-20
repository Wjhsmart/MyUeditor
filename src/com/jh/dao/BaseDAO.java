package com.jh.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BaseDAO {

	public Connection conn;
	
	public void getConn() {
		try {
			Context context = new InitialContext();
			Object obj = context.lookup("java:comp/env/datasource/mysql");
			if (obj instanceof DataSource) {
				DataSource dataSource = (DataSource) obj;
				conn = dataSource.getConnection();
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (conn != null && conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
