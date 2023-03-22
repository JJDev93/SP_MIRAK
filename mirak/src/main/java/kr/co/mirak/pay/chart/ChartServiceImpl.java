package kr.co.mirak.pay.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

	    List<Double> totalPrice = new ArrayList<>();
	    List<String> pro_name = new ArrayList<>();

	    List<TotalByMenuVO> totalByMenuList = mapper.getTotalByMenuList(vo);
	    for (TotalByMenuVO item : totalByMenuList) {
	    	totalPrice.add((double) item.getTotalPrice());
	        pro_name.add(item.getPro_name());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("totalPrice", new ArrayList<Object>(totalPrice));
	    map.put("pro_name", new ArrayList<Object>(pro_name));

	    return map;
	}

	@Override
	public Map<String, List<Object>> getTotalByDayList(TotalByDayVO vo, String clickedMonth) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		System.out.println("clickedMonth는 ~~~~~~~~~~~" + clickedMonth);
	    List<Double> totalPrice = new ArrayList<>();
	    List<String> pay_date = new ArrayList<>();

	    List<TotalByDayVO> totalByDayList = mapper.getTotalByDayList(vo, clickedMonth);
	    for (TotalByDayVO item : totalByDayList) {
	    	totalPrice.add((double) item.getTotalPrice());
	        pay_date.add(item.getPay_date());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("totalPrice", new ArrayList<Object>(totalPrice));
	    map.put("pay_day", new ArrayList<Object>(pay_date));

	    return map;
		
	}
	
	@Override
	public Map<String, List<Object>> getTotalByMonthList(TotalByDayVO vo) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		
		List<Double> totalPrice = new ArrayList<>();
		List<String> pay_date = new ArrayList<>();
		
		List<TotalByDayVO> totalByMonthList = mapper.getTotalByMonthList(vo);
		for (TotalByDayVO item : totalByMonthList) {
			totalPrice.add((double) item.getTotalPrice());
			pay_date.add(item.getPay_date());
		}
		
		Map<String, List<Object>> map = new HashMap<>();
		map.put("totalPrice", new ArrayList<Object>(totalPrice));
		map.put("pay_month", new ArrayList<Object>(pay_date));
		
		return map;
		
	}

	@Override
	public Map<String, List<Object>> getTotalByEachMenu(TotalByDayVO vo, String clickedMenu) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		System.out.println("clickedMenu는 ~~~~~~~~~~~" + clickedMenu);
	    List<Double> totalPrice = new ArrayList<>();
	    List<String> pay_date = new ArrayList<>();

	    List<TotalByDayVO> totalByEachMenu = mapper.getTotalByEachMenu(vo, clickedMenu);
	    for (TotalByDayVO item : totalByEachMenu) {
	    	totalPrice.add((double) item.getTotalPrice());
	        pay_date.add(item.getPay_date());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("totalPrice", new ArrayList<Object>(totalPrice));
	    map.put("pay_day", new ArrayList<Object>(pay_date));

	    return map;
	}
}
