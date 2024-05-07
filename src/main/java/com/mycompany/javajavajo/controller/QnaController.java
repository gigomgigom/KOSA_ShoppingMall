package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	// 글쓰기 페이지로 이동
	@GetMapping("/writeBoard")
	public String writeBoard() {
		return "board/writeBoard";
	}
	
	@RequestMapping("/list")
	public String listBoard(@RequestParam(defaultValue="") String keyword, Authentication authentication,Model model) {
		List<Qna> qna = qnaService.getQnaList(keyword);
		model.addAttribute("qnaList", qna);
		return "board/list";
		
	}
		
	//글쓰기 페이지에서 dto로 게시물 작성에 필요한 정보들을 얻어옴
	// Controller에서 Service로 요청
	@PostMapping("/writeBoard")
	public String writeBoard(Qna qna) {
		qnaService.writeBoard(qna);
		return "redirect:/board/list";
		//클라이언트 요청 -> 컨트롤러 -> 클라이언트 -> 경로로 이동시킴
	}
	
	@GetMapping("/detailBoard")
	public String detailBoard(int qnano, Model model) {
		log.info("run");
		Qna qna = qnaService.getQna(qnano); // dto를 통해서 한 게시물의 정보를 가져옴
		model.addAttribute("qna", qna);
		log.info(qna.getQnatitle());
		return "board/detail";
	}
	//글수정할 페이지 이동
	@GetMapping("/updateBoard")
	public String updateBoard(int qnano, Model model) {
		Qna qna = qnaService.getQna(qnano);
		model.addAttribute("qna", qna);
		return "board/writeBoard";
	}
	// 글수정된 페이지로 이동
	@PostMapping("/updateBoard")
	public String updateBoard(Qna qna) {
		qnaService.updateBoard(qna);
		log.info("실행 post");
		return "redirect:/board/detailBoard?qnano="+qna.getQnano();
	}
	
	
}






