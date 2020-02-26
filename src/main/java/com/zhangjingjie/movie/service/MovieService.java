package com.zhangjingjie.movie.service;

import java.util.List;

import com.zhangjingjie.movie.domain.Movie;
import com.zhangjingjie.movie.vo.MovieVo;

public interface MovieService {
	/**
	 * 
	    * @Title: selects
	    * @Description: TODO(模糊查询)
	    * @param @param movieVo
	    * @param @return    参数
	    * @return List<Movie>    返回类型
	    * @throws
	 */
	List<Movie> selects(MovieVo movieVo);

	boolean deleteOne(Integer id);

	boolean pidelete(String gids);
}
