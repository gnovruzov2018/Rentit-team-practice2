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

import root.domain.POStatus;
import root.domain.PurchaseOrder;

@RequestMapping("/purchaseorders")
@Controller
@RooWebScaffold(path = "purchaseorders", formBackingObject = PurchaseOrder.class)
public class PurchaseOrderController {
	@RequestMapping(value="/postpo",method = RequestMethod.POST,headers = "Accept=application/json")
    public ResponseEntity<Void> save(@RequestBody PurchaseOrder res) {
		PurchaseOrder p = new PurchaseOrder();
		p.setStartDate(res.getStartDate());
		p.setEndDate(res.getEndDate());
		p.setTotal(res.getTotal());
		p.setPlant(res.getPlant());
		p.persist();
		HttpHeaders headers = new HttpHeaders();
		URI location = ServletUriComponentsBuilder.fromCurrentRequestUri().
		pathSegment(p.getId().toString()).build().toUri();
		headers.setLocation(location);
		ResponseEntity<Void> response = new
		ResponseEntity<Void>(headers, HttpStatus.CREATED);
		return response;
    }
	@RequestMapping(value = "/json",headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> listJson() {
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	    List<PurchaseOrder> result = PurchaseOrder.findAllPurchaseOrders();
	    return new ResponseEntity<String>(PurchaseOrder.toJsonArray(result), headers, HttpStatus.OK);
	}
	@RequestMapping(method = RequestMethod.POST,value = "/delete/{id}", headers = "Accept=application/json")
	public void showJson(@PathVariable("id") Long id) {
		PurchaseOrder purchaseOrder = PurchaseOrder.findPurchaseOrder(id);
        purchaseOrder.setStatus(POStatus.CANCELLED);
        purchaseOrder.persist();
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	}
}
