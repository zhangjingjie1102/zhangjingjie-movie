package com.zhangjingjie.movie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangjingjie.movie.dao.MovieMapper;
import com.zhangjingjie.movie.domain.Movie;
import com.zhangjingjie.movie.service.MovieService;
import com.zhangjingjie.movie.vo.MovieVo;
@Service
public class MovieServiceImpl implements MovieService {
	
	
	@Autowired
	private MovieMapper movieMapper;
	
	@Override
	public List<Movie> selects(MovieVo movieVo) {
		return movieMapper.selects(movieVo);
	}

	@Override
	public boolean deleteOne(Integer id) {
		return movieMapper.deleteOne(id)>0;
	}

	@Override
	public boolean pidelete(String gids) {
		return movieMapper.pidelete(gids)>0;
	}

}
