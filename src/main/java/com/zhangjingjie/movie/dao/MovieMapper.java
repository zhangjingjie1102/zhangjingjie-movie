package com.zhangjingjie.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhangjingjie.movie.domain.Movie;
import com.zhangjingjie.movie.vo.MovieVo;

public interface MovieMapper {
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

	Integer deleteOne(Integer id);

	Integer pidelete(@Param("gid") String gids);

}
