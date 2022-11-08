package com.gongcha.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gongcha.dto.BoardDTO;
import com.gongcha.service.BoardService;
import com.gongcha.service.ReplyService;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;


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
	public ModelAndView recruit_regi(HttpServletResponse response,HttpSession session,String stadium_name) throws Exception {
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

			List<BoardDTO> my=boardService.getStadium(stadium_name);
			if(g.isEmpty()) {
				out.println("<script>");
				out.println("alert('예약하신 구장이 없습니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {

				ModelAndView f=new ModelAndView();

				f.addObject("li",g);
				f.addObject("my",my);
				f.setViewName("/recruit/recruit_regi");

				return f;
			}
		}

		return null;
	}

	@ResponseBody
	@PostMapping("/stadium_name_check")
	public String stadium_name_check(@RequestParam("stadium_name") String stadium_name, HttpServletResponse response,
			HttpSession session, BoardDTO a) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		String id=(String)session.getAttribute("id");

		Gson gson=new Gson();
		HashMap<String,Object> map =new HashMap<>();

		a.setMem_id(id);
		a.setStadium_name(stadium_name);
		List<BoardDTO> sn = boardService.getInfo(a);

		map.put("sn",sn);

		String json=gson.toJson(map);
		System.out.println("json : "+json);

		return json;

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
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
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
		return null;
	}
	
//	//댓글 목록
//	@ResponseBody
//	@RequestMapping("/recruit_reply")
//	public HashMap<String, Object> recruit_reply(@RequestParam String mem_id,BoardDTO t) {
//        HashMap<String, Object> map = new HashMap<>();
//        t.setMem_id(mem_id);
//        Optional<BoardDTO> fi = boardService.findId(t);
//        List<ReplyDTO> re = replyService.findRecruit(fi.get());
//
//        List<ReplyDTO> replyList = new ArrayList<>(); // 댓글 리스트
//        List<Long> Count = new ArrayList<>(); // 대댓글 갯수 카운트
//
//        for (int i = 0; i < re.size(); i++) {
//            replyList.add(re.get(i).getReply_content());
//            ccCountList.add(boardCommentQueryRepository.findReCommentCnt(boardCommentEntityList.get(i).getId())); //대댓글 갯수 카운트
//        }
//        map.put("list", boardCommentDtoList);
//        map.put("commentCnt", ccCountList);
//
//        return map;
//    }

	//게시글 수정
	@RequestMapping("/recruit_edit")
	public ModelAndView recruit_(HttpServletResponse response,HttpSession session,BoardDTO i,@RequestParam int recruit_no,
			String stadium_name) throws Exception {
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

			i=boardService.getRegi(recruit_no);

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

					i=boardService.getCont(recruit_no);
					String cont=i.getRecruit_content().replace("\n","<br/>");
					
					List<BoardDTO> my=boardService.getStadium(stadium_name);
					
					ModelAndView f=new ModelAndView();
					
					f.addObject("my",my);
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
			j.setMem_id(id);
			boardService.edit(j);
			
			return "redirect:/recruit_detail?recruit_no="+j.getRecruit_no();

		}
		return null;
	}

	@RequestMapping("recruit_del")
	public String recruit_del(HttpServletResponse response,@RequestParam int recruit_no,BoardDTO de,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		String id=(String)session.getAttribute("id");
		
		de.setMem_id(id);
		de.setRecruit_no(recruit_no);
		boardService.delRecruit(de);
		
		return "redirect:/recruit";
	}
}
