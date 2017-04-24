package com.dbUtil;

import java.io.File;

import javax.sql.ConnectionPoolDataSource;

import org.sqlite.javax.SQLiteConnectionPoolDataSource;

/**
 * 根据传入的参数确认数据源的数据库类型
 * @author SShi11
 *
 */
public class DataSourceFactory {
	//System.getProperty("user.dir");
	static final String sqlLiteUrl="jdbc:sqlite:C:\\ProjectResources\\gitLocalResource\\ProjectResource\\travelerTools\\resource\\logging.db";
	public static ConnectionPoolDataSource createDataSource() throws Exception {
		String path=System.getProperty("user.dir")+File.separator+"logging.db";
		SQLiteConnectionPoolDataSource dataSource = new SQLiteConnectionPoolDataSource();
		dataSource.setUrl("jdbc:sqlite:"+path);
		dataSource.setJournalMode("WAL");
		dataSource.getConfig().setBusyTimeout("10000");
		return dataSource;
	}
	
	
	
	 // Version for the Microsoft SQL Server driver (sqljdbc.jar):
	   /*
	      com.microsoft.sqlserver.jdbc.SQLServerXADataSource dataSource = new com.microsoft.sqlserver.jdbc.SQLServerXADataSource();
	      dataSource.setApplicationName("TestMiniConnectionPoolManager");
	      dataSource.setDatabaseName("Test");
	      dataSource.setServerName("localhost");
	      dataSource.setUser("sa");
	      dataSource.setPassword(System.getProperty("saPassword"));
	      dataSource.setLogWriter(new PrintWriter(System.out));
	   */

	   // Version for Oracle:
	   /*
	      oracle.jdbc.pool.OracleConnectionPoolDataSource dataSource = new oracle.jdbc.pool.OracleConnectionPoolDataSource();
	      dataSource.setDriverType("thin");
	      dataSource.setServerName("vm1");
	      dataSource.setPortNumber(1521);
	      dataSource.setServiceName("vm1.inventec.ch");
	      dataSource.setUser("system");
	      dataSource.setPassword("x");
	   */
	
	
}
