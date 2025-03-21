package com.servlets;

import com.dao.SkinDao;

public class Test {
   public static void main(String[]args) {
	   SkinDao dao=new SkinDao();
	   dao.getCurrentRoutinesByUserId(1);
   }

}
