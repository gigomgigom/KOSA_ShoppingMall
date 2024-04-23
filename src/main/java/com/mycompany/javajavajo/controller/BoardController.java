package com.mycompany.javajavajo.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.javajavajo.dto.Board;
import com.mycompany.javajavajo.dto.Uplload;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/list")
	public String list() {
		return "board/list";
	}

	@RequestMapping("/create")
	public String create() {
		return "board/create";
	}

	@RequestMapping("/detail")
	public String detail(int bno, HttpSession session, Model model) {
		List<Board> boardList = (List<Board>) session.getAttribute("boardList");
		for (Board board : boardList) {
			if (board.getBno() == bno) {
				board.setHitcount(board.getHitcount() + 1);
				model.addAttribute("board", board);
				break;
			}
		}
		return "board/detail";
	}

	@PostMapping("/createBoard")
	public String createBoard(Uplload board, HttpSession session) throws IllegalStateException, IOException {
		File destDir = new File("C:/Temp/uploadFiles");
		if (!destDir.exists())
			destDir.mkdirs();
		
		List<String> newAttach = new ArrayList<>();
		for (MultipartFile mf : board.getAttach()) {
			String fileName = mf.getOriginalFilename();
			File destFile =new File(destDir, fileName); 
			mf.transferTo(destFile);
			newAttach.add(fileName);
		}
	
		 List<Board> boardList = (List<Board>) session.getAttribute("boardList"); 
		 if(boardList == null) { 
			 boardList = new ArrayList<Board>();
		 session.setAttribute("boardList", boardList); 
		 }
		 
		Board newBoard = new Board(boardList.size()+1, board.getTitle(), board.getContent(), board.getId(), newAttach, 0, new Date());
		boardList.add(newBoard);
		return "redirect: list";
	}

	@GetMapping("/downloadFile")
	public void downloadFile(String fileName, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String filePath = "C:/Temp/uploadFiles/" + fileName;
		String fileType = request.getServletContext().getMimeType(fileName);
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		OutputStream os = response.getOutputStream();
		Path path = Paths.get(filePath);
		Files.copy(path, os);
		os.flush();
		os.close();
	}

}
