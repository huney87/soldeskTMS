package gwangjae.tms.genre.controller;

import gwangjae.tms.genre.domain.Genre;
import gwangjae.tms.genre.service.GenreService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value="genreController")
@RequestMapping("/genre")
public class GenreController {
	@Autowired
	@Qualifier("genreService")
	GenreService genreService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String moveToGenreMainPage(Model model){
		List<Genre> genreList = genreService.getGenreList();
		List<Genre> genreMajorList = genreService.getGenreMajorList();
		int genreAllCnt = genreList.size();
		int genreCode1Cnt = genreMajorList.size();
		model.addAttribute("genreList",genreList);
		model.addAttribute("genreMajorList",genreMajorList);
		model.addAttribute("genreAllCnt",genreAllCnt);
		model.addAttribute("genreCode1Cnt",genreCode1Cnt);
		return "/admin/adminGenre";
	}
}
