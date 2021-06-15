package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@Service("MovieTimeinsertReg")
public class MovieTimeinsertReg implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(MovieTimeDTO dto) {
		AlterDTO alter = new AlterDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");

		alter.setMsg("등록됨");
		alter.setUrl("/admin/movietime/list?dal=" + dto.getDal() + "&el=" + dto.getEl());

		dto.setStarttime(dto.getTimeDate(dto.getTime()));
		MovieInfoDTO buf = db.findMovie(dto.getMovietitle());
		dto.setEndtime(dto.getEndTimeDate(buf.getMplaytime(), dto.getStarttime()));
		dto.setReg_date(dto.getRegDate(dto.getDal(), dto.getEl()));

		ArrayList<MovieTimeDTO> realar = new ArrayList<>();
		ArrayList<MovieTimeDTO> timedto = (ArrayList<MovieTimeDTO>) db.movieTime();
		
		if (dto.getCheck().equals("false")) {
			db.insertMovieTime(dto);
		} else {
			MovieTimeDTO ac = dto.getEndRegDate(dto);
			if (ac.getEndReg_date_re().before(ac.getReg_date())) {
				alter.setMsg("날짜 설정이 잘못되었습니다.");
				return alter;
			} else {
				if (dto.getDayto() == null || dto.getDayto().equals("") || dto.getEndReg_date().equals("")
						|| dto.getEndReg_date() == null) {
					alter.setMsg("입력하신 것들 중 입력 안한것이 있어 등록에 실패하였습니다.");
				} else {
					db.insertMovieTime(dto); // 당일 등록은 필수.

					Calendar start = Calendar.getInstance();
					start.setTime(dto.getReg_date());

					Calendar finish = Calendar.getInstance(); // 끝
					finish.setTime(dto.getEndRegDate(dto).getEndReg_date_re());

					String[] ar = dto.getDayto().split(",");

					while (true) {
						start.add(Calendar.DATE, 1);
						for (int i = 0; i < ar.length; i++) {
							if (start.get(Calendar.DAY_OF_WEEK) == Integer.parseInt(ar[i])) {
								dto.setReg_date(start.getTime());
								realar.add(dto);
								System.out.println(sdf.format(dto.getReg_date()));
								break;
							}
						}
						for (MovieTimeDTO a : timedto) {
							if(dto.getSectorno().equals(a.getSectorno()) && dto.getMovietitle().equals(a.getMovietitle())) {
								if(dto.getStarttime().before(a.getEndtime()) && dto.getStarttime().after(a.getStarttime())) {
									alter.setMsg("입력하신 것들 중 중복되는 시간이 있습니다.");
									return alter;
								}
							}
						}
						if (sdf.format(start.getTime()).equals(sdf.format(finish.getTime()))) {
							break;
						}
					}
					
					for (MovieTimeDTO a : realar) {
						db.insertMovieTime(a);
					}
					
					
				}
			}

		}

		return alter;
	}
}
