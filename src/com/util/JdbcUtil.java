package com.util;

/**
*
* 说明:JDBC工具类 用于数据库连接以及数据库资源释放
* 
* @author LS
* 
*/

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


public class JdbcUtil {

	private static JdbcUtil jdbcUtil;
	private static String url = null;
	private static String username = null;
	private static String password = null;
	private static String driver = null;
	private static Properties props = new Properties();

	static {

		try {
			// 读取数据库配置文件
			props.load(JdbcUtil.class.getResourceAsStream("/jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}

		url = (props.getProperty("jdbc.url"));
		username = (props.getProperty("jdbc.username"));
		password = (props.getProperty("jdbc.password"));
		driver = (props.getProperty("jdbc.driver"));

		// 加载数据库驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	// 单例模式
	public JdbcUtil getJdbcUtil() {

		if (jdbcUtil == null) {
			synchronized (JdbcUtil.class) {
				if (jdbcUtil == null) {
					jdbcUtil = new JdbcUtil();
				}
			}
		}
		return jdbcUtil;
	}

	/**
	 * 创建一个数据库连接
	 * 
	 * @return 一个数据库连接
	 * 
	 */
	public Connection getConnection() {
		Connection conn = null;
		// 创建数据库连接
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 释放数据库资源
	 */
	public void release(Object o) {
		if (o == null) {
			return;
		}
		if (o instanceof ResultSet) {
			try {
				((ResultSet) o).close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (o instanceof PreparedStatement) {
			try {
				((PreparedStatement) o).close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (o instanceof Connection) {
			Connection c = (Connection) o;
			try {
				if (!c.isClosed()) {
					c.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// 释放数据库资源方法重载
	public void release(ResultSet rs, PreparedStatement pst, Connection conn) {
		release(rs);
		release(pst);
		release(conn);
	}

}
