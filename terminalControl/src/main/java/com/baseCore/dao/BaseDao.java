package com.baseCore.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao {
	/**
	 * <p>
	 * 注意：</br>
	 * <font color='red'>为了保持代码的统一性:只对当前对象进行操作!</font>
	 * </br></br>
	 * 功能描述：查询数据列表集合
	 * </p>
	 *@param Map<String,Object> params
	 *@return  List<Map<String,Object>>
	 *作者：SShi11
	 *日期：Apr 15, 2017 2:42:48 PM
	 */
	public List<Map<String,Object>> queryMapList(Map<String,Object> params);
	
	/**
	 *<p>
	 *注意：</br>
	 *<font color='red'>为了保持代码的统一性:只对当前对象进行操作!</font>
	 *</br></br>
	 *功能描述：更新数据
	 * </p>
	 *@param Map<String,Object> params
	 *@return 影响的行数
	 *作者：SShi11
	 *日期：Apr 15, 2017 2:44:35 PM
	 */
	public Integer updateEntity(Map<String,Object> params);
}
