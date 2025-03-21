package com.servlets;

import com.dao.HairDao;
import com.dao.SkinDao;
import com.generator.HairPrompt;
import com.generator.HairRecommendations;
import com.generator.SkinPrompt;
import com.generator.SkinRecommendations;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.pojo.HairDetails;
import com.pojo.SkinDetails;
import com.pojo.UserDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SaveHaircareDataServlet")
public class HairDataServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		Gson gson = new Gson();
		HairDetails haircareData = gson.fromJson(request.getReader(), HairDetails.class);

		String userId = ((String) request.getSession().getAttribute("user_id"));
		UserDetails user = (UserDetails) request.getSession().getAttribute("user");
		haircareData.setUser_id(userId);
		System.out.println("Parsed Haircare Data: " + haircareData);

		String prompt = HairPrompt.prompt(haircareData, user);
		HairRecommendations.generator(prompt, userId);

		HairDao dao = new HairDao();
		boolean success = false;
		try {
			success = dao.insertHairData(haircareData);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (success) {
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("{\"message\": \"Data saved successfully.\"}");
		} else {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("{\"message\": \"Failed to save data.\"}");
		}

	}

}
