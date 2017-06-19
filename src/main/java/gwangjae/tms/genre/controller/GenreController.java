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
		model.addAttribute("genreList",genreList);
		return "/admin/genre";
	}
}
