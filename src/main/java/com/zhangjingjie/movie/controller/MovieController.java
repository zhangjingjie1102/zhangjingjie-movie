package com.zhangjingjie.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangjingjie.movie.domain.Movie;
import com.zhangjingjie.movie.service.MovieService;
import com.zhangjingjie.movie.vo.MovieVo;

@Controller
public class MovieController {
	
	
	@Autowired
	private MovieService movieService;
	
	
	@RequestMapping("selects")
	public String list(MovieVo movieVo,Model model,Integer pageNum) {
		
		if(pageNum==null) {
			pageNum=1;
		}
		
		PageHelper.startPage(pageNum, 3);
		List<Movie> list = movieService.selects(movieVo);
		PageInfo<Movie> page = new PageInfo<Movie>(list);
		
		model.addAttribute("list", list);
		model.addAttribute("movieVo", movieVo);
		model.addAttribute("page", page);
		return "list";
	}
	
	@ResponseBody
	@RequestMapping("deleteOne")
	public boolean deleteOne(Integer id) {
		
		boolean flag = movieService.deleteOne(id);
		return flag;
	}
	
	
	@ResponseBody
	@RequestMapping("pidelete")
	public boolean pidelete(String gids) {
		System.out.println(gids);
		
		boolean flag = movieService.pidelete(gids);
		return flag;
	}
	
	@RequestMapping("add")
	public String add() {
		return "add";
	}
}
