package com.shlanbao.tzsc.utils.tools;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * <li>@author Leejean
 * <li>@create 2014-7-5下午09:18:48
 */
/*@WebServlet("/InitResourceServlet")*/
public class WctServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 8369621959536033717L;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public WctServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/wct/sys/login.jsp").forward(request, response);
	}

}
