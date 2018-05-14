package com.service;

import java.sql.SQLException;
import java.util.*;

import com.util.*;

public class text {
	static List<Object[]> goodss=new ArrayList<Object[]>();
	public static void main(String[] args) throws SQLException{
		
		/*BaseDao db=new BaseDao();
		goodss=db.select("SELECT * FROM goods",4, new Object[]{});
		for(int i=0;i<4;i++) {
			for(int j=0;j<4;j++) {
				System.out.print(goodss.get(i)[j]+" ");
			}
			System.out.println("");
		}*/
		/*int x=0;
		change c=new change();
		try {
			goodss=c.showgood();
			x=c.delete(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(x);
		for(int i=0;i<4;i++) {
			for(int j=0;j<4;j++) {
				System.out.print(goodss.get(i)[j]+" ");
			}
			System.out.println("");
		}*/
		goodss=new BaseDao().select("SELECT * FROM goods WHERE id=?", 4, new Object[]{1});
		for(int i=0;i<4;i++) {
			System.out.println(goodss.get(0)[i]);
		}
		//c.close();
	}
}
