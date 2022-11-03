package com.gongcha.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gongcha.dto.BoardDTO;
import com.gongcha.dto.Stadium_matchDTO;
import com.gongcha.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;


	@RequestMapping("/recruit")
	public ModelAndView recruit(HttpServletResponse response, @ModelAttribute BoardDTO r ) {
		response.setContentType("text/html;charset=UTF-8");

		List<BoardDTO> rList=boardService.getRecruit(r);

		ModelAndView ma=new ModelAndView();
		ma.addObject("list",rList);
		ma.setViewName("recruit/recruit");

		return ma;
	}

	@RequestMapping("/recruit_regi")
	public ModelAndView recruit_regi(HttpServletResponse response,HttpSession session, Stadium_matchDTO h) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {

			List<BoardDTO> g=boardService.getMatch(id);

			if(g.isEmpty()) {
				out.println("<script>");
				out.println("alert('예약하신 구장이 없습니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				ModelAndView f=new ModelAndView();

				f.addObject("li",g);

				f.setViewName("/recruit/recruit_regi");

				return f;
			}
		}

		return null;
	}

	//게시글 작성
	@RequestMapping("/recruit_regi_ok")
	public String recruit_regi_ok(HttpServletResponse response, BoardDTO p,HttpSession session,int stadium_match_no) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");
		p.setMem_id(id);

		BoardDTO ck=boardService.checkOver(stadium_match_no);

		if(!(ck == null)) {
			out.println("<script>");
			out.println("alert('이미 작성된 매치입니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {

			boardService.insertRegi(p);

			return "redirect:/recruit";
		}
		return null;
	}

	//게시글 보기
	@RequestMapping("/recruit_detail")
	public ModelAndView recruit_detail(@RequestParam("recruit_no") int recruit_no, BoardDTO o,
			HttpServletResponse response,HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		String id=(String)session.getAttribute("id");

		o=this.boardService.getCont(recruit_no);
		
		String cont=o.getRecruit_content().replace("\n","<br/>");

		o.setMem_id(id);

		BoardDTO e=boardService.getId(o);

		ModelAndView ml=new ModelAndView();

		ml.addObject("cont",cont);
		ml.addObject("o",o);

		ml.addObject("t",e);

		ml.setViewName("/recruit/recruit_detail");

		return ml;
	}

	//게시글 수정
	@RequestMapping("/recruit_edit")
	public ModelAndView recruit_(HttpServletResponse response,HttpSession session,BoardDTO i,@RequestParam int recruit_no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			i.setMem_id(id);
			i.setRecruit_no(recruit_no);
			BoardDTO id_check=boardService.idCheck(i);
			
//			String qs="recruit_detail?recruit_no="+i.getRecruit_no();
//			String qs=Integer.toString(recruit_no);
			i=boardService.getRegi(recruit_no);
//			System.out.println("컨트 : "+recruit_no+" 맵 : "+i.getRecruit_no());
//			String no= Integer.toBinaryString(i.getRecruit_no());
			if(id_check == null || !(recruit_no == i.getRecruit_no()) ) {
				out.println("<script>");
				out.println("alert('잘못된 접근입니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				List<BoardDTO> g=boardService.getMatch(id);

				if(g.isEmpty()) {
					out.println("<script>");
					out.println("alert('예약하신 구장을 다시 확인해주세요!');");
					out.println("history.back();");
					out.println("</script>");
				}else {

					i=boardService.getRegi(recruit_no);
					String cont=i.getRecruit_content().replace("\n","<br/>");

					ModelAndView f=new ModelAndView();

					f.addObject("li",g);
					f.addObject("re",i);
					f.addObject("cont",cont);

					f.setViewName("/recruit/recruit_edit");

					return f;

				}
			}
		}
		return null;
	}

	//게시글 수정 완료
	@RequestMapping("/recruit_edit_ok")
	public String recruit_edit_ok(HttpSession session,HttpServletResponse response,@ModelAttribute BoardDTO j) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			boardService.edit(j);
			System.out.println("확인요 "+j);
			return "redirect:/recruit_detail?recruit_no="+j.getRecruit_no();

		}
		return null;
	}

	@RequestMapping("recruit_del")
	public String recruit_del(HttpServletResponse response, int recruit_no) throws Exception{
		PrintWriter out=response.getWriter();


		return null;
	}
}
