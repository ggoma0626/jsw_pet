package com.my.jsw_pet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.jsw_pet.service.ProgramOtherImgService;
import com.my.jsw_pet.vo.ProgramOtherImg;

@Controller
@RequestMapping(value="poi")
public class ProgramOtherImgController {
	
	@Autowired
	ProgramOtherImgService programOtherImgService;
	
	
	@GetMapping("getImgsByProgram")
	@ResponseBody
	public List<ProgramOtherImg> getImgsByProgram(
			@RequestParam(value= "pro_idx") int pro_idx
			) {
		 
		return programOtherImgService.findByProgramIdx(pro_idx);			
	}
	
	@GetMapping("save")
	@ResponseBody
	public String save(
			@RequestParam(value= "pro_idx") int pro_idx,
			@RequestParam(value= "other_img_url") String other_img_url
			) {		 
		
		ProgramOtherImg poi = new ProgramOtherImg();
		poi.setPro_idx(pro_idx);
		poi.setOther_img_url(other_img_url);
		
		programOtherImgService.save(poi);
		
		return "ok";
	}
}
