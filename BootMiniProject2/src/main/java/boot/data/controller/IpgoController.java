package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller 
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start()
	{
		return "/layout/main"; //리스트로 가게 하자
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//전체조회
		List<IpgoDto> list=mapper.getAllDatas();
		
		
		for(IpgoDto dto:list)
		{
			String [] photos=dto.getPhotoname().split(",");
			dto.setDimage(photos[0]); 
		}
		
		
		
		model.addObject("list", list);
		//전체 갯수 
		int totalCount = mapper.getTotalCount();
		model.addObject("totalCount", totalCount);
		//model.setViewName("ipgolist"); jsp리졸버
		model.setViewName("/ipgo/ipgolist");
		
		
		return model;
	}
	
	
	@GetMapping("/ipgo/form")//폼으로 이동시키기
	public String form()
	{
		//return "ipgoform";
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto,  //사진은 안넘어오기때문에
			@RequestParam ArrayList<MultipartFile> upload, //사진
			HttpSession session)  
	{
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		String uploadName="";
		int idx=1;
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else
		{
			for(MultipartFile f:upload)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss"); //겹치지않게 해주는거
				String fName=idx++ +"_"+sdf.format(new Date())+"_"+f.getOriginalFilename(); //인덱스 번호 붙이기
				uploadName+=fName+",";
				
				///업로드 
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			uploadName=uploadName.substring(0,uploadName.length()-1);
		}
		
		
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpog(dto);
		
		return "redirect:list";
	}
	
	// 오시는길로 가기 
	@GetMapping("/load/map")
	public String load()
	{
		return "/load/map"; //title레이아아웃 /폴더명/파일명 or /sub/폴더명/파일몀ㅇ
	}
}
