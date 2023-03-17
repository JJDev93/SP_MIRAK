package kr.co.mirak.pay.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mirak.pay.PayVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ChartServiceImpl() {
	}

	public ChartServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<PayVO> list() {

		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		List<PayVO> list = mapper.list();

		return list;
	}

	@Override
	public int statUpdate(PayVO vo) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		int result = mapper.statUpdate(vo);

		return result;
	}

	@Override
	public Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

	    List<Double> total = new ArrayList<>();
	    List<String> menu = new ArrayList<>();

	    List<TotalByMenuVO> totalByMenuList = mapper.getTotalByMenuList(vo);
	    System.out.println(totalByMenuList);
	    for (TotalByMenuVO item : totalByMenuList) {
	        total.add((double) item.getTotal());
	        menu.add(item.getMenu());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("menu", new ArrayList<Object>(menu));
	    map.put("total", new ArrayList<Object>(total));

	    return map;
	}

	@Override
	public Map<String, List<Object>> getTotalByDayList(TotalByDayVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		
	    List<Double> total = new ArrayList<>();
	    List<String> day = new ArrayList<>();

	    List<TotalByDayVO> totalByDayList = mapper.getTotalByDayList(vo);
	    System.out.println(totalByDayList);
	    for (TotalByDayVO item : totalByDayList) {
	        total.add((double) item.getTotal());
	        day.add(item.getOrder_date());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("day", new ArrayList<Object>(day));
	    map.put("total", new ArrayList<Object>(total));

	    return map;
		
	}

}
