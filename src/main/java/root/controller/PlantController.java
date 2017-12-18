package root.controller;
import java.net.URI;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import root.domain.Plant;

@RequestMapping("/plants")
@Controller
@RooWebScaffold(path = "plants", formBackingObject = Plant.class)
public class PlantController {


	@RequestMapping(value = "/json",headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	    List<Plant> result = Plant.findAllPlants();
	    return new ResponseEntity<String>(Plant.toJsonArray(result), headers, HttpStatus.OK);
	}
	@RequestMapping(value = "/json/{id}", headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> showJson(@PathVariable("id") Long id) {
	    Plant plant = Plant.findPlant(id);
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	    if (plant == null) {
	        return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	    }
	    return new ResponseEntity<String>(plant.toJson(), headers, HttpStatus.OK);
	}
}
