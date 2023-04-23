package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController // 로그인 전용
public class LoginRestController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/login")
	public Map<String,String> loginproc(String id , String pass,HttpSession session)
	{ 
		
		Map<String , String> map=new HashMap<>();
		int result=service.loginIdPassCheck(id, pass);
		
		if(result==1)
		{
			//아이디와 비밀번호 일치하면 세션유지설정
			session.setMaxInactiveInterval(60*60*4); //4시간
			//로그인한 정보얻기 
			MemberDto mdto=service.getDataByid(id);
			
			
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("loginphoto",mdto.getPhoto() );
			session.setAttribute("loginname",mdto.getName() );
			
			
			
		}
		map.put("result", result==1?"success":"fail");

		
 		return map;
	}
	
	
	//로그아웃
	
	@GetMapping("/member/logout")
	public void logoutproc(HttpSession session)
	{
		//로그아웃때 제거 되어야할 세션
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}
}


