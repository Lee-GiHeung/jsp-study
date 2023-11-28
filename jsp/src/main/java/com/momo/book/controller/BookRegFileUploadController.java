package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.service.FileUploadService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BookRegFileUploadController
 */
@WebServlet("/book/bookRegUploadProcess")
public class BookRegFileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일 저장
		FileUploadService fileService = new FileUploadService();
		MultipartRequest mr =  fileService.fileUpload(request, "imgFile", "book");
		
		String title = mr.getParameter("title");
		String author = mr.getParameter("author");
		System.out.println(title + "/" + author);
		
	}

}
