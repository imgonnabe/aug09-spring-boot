package com.qorlwn.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.qorlwn.web.dto.BoardDTO;
import com.qorlwn.web.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		List<BoardDTO> list = boardService.boardList();
		model.addAttribute("list", list);
		System.out.println(list);
		return "board";
	}
	/*
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam("bno") int bno) {
		BoardDTO dto = boardService.detail(bno);
		ObjectNode json = JsonNodeFactory.instance.objectNode();
		//JSONObject e = new JSONObject();
		json.put("content", dto.getBcontent());
		json.put("uuid", dto.getBuuid());
		json.put("ip", dto.getBip());
		
		//json.put("result", e);
		// System.out.println(json.toString());// {"result":{"content":"[sdfsdf][sdfsdf]"}}
		return json.toString();
	}
	*/
	
	@ResponseBody
	@PostMapping("/detail2")
	public String detail2(@RequestParam("bno") int bno) throws JsonProcessingException {
		BoardDTO dto = boardService.detail2(bno);
		
		ObjectMapper mapp = new ObjectMapper();
		String json = mapp.writeValueAsString(dto);
		return json;
	}
	
	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, HttpSession session) {
		// System.out.println(request.getParameter("title"));
		// System.out.println(request.getParameter("content"));
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setM_id(String.valueOf(session.getAttribute("m_id")));
		dto.setBip("0.0.0.0");
		int result = boardService.write(dto);
		return "redirect:/board";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam Map<String,Object> map) {
		System.out.println(map);
		return "redirect:/board";
	}
}