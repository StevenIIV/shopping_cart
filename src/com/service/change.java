package com.service;

import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;

import com.util.BaseDao;
import com.util.JdbcUtil;
public class change {
	private Connection conn;
	private List<Object[]> rs;
	private BaseDao dao;
	public change() {
		try {
			conn=new JdbcUtil().getJdbcUtil().getConnection();
			dao=new BaseDao();
			}catch(Exception e) {
			e.printStackTrace();
			}
	}
	public int input(int good_id) throws Exception{
		int res=0;
		Object[] param= {good_id};
		List<Object[]> good=dao.select("SELECT * FROM goods WHERE id=?", 4, param);
		rs=dao.select("SELECT * FROM user_shoppingcart WHERE good_id=?", 3, param);
		if(rs.isEmpty()) {
			res=dao.insert("INSERT INTO user_shoppingcart (good_id,good_num,total_price) VALUES (?,?,?)", new Object[] {good_id,1,good.get(0)[2]});
		}
		else {
			res=dao.update("UPDATE user_shoppingcart SET good_num=good_num+1,total_price=total_price+? WHERE good_id=?", new Object[]{good.get(0)[2],good_id});
		}
		return res;
	}
	public int delete(int good_id) throws Exception{
		Object[] param= {good_id};
		rs=dao.select("SELECT * FROM user_shoppingcart WHERE good_id=?", 3, param);
		if(rs.isEmpty()) {
			return 0;
		}
		else {
			int res=dao.delete("DELETE FROM user_shoppingcart WHERE good_id=?", param);
			return 1;
		}
	}
	public List<Object[]> showgood() throws Exception {
		return dao.select("SELECT * FROM goods", 4, new Object[]{});
	}
	public List<Object[]> showshopping_cart() throws Exception {
		return dao.select("SELECT * FROM user_shoppingcart", 3, new Object[]{});
	}
	public void close() {
		dao.close();
	}
}
