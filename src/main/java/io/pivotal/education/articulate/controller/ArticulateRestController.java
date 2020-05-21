package io.pivotal.education.articulate.controller;

import io.pivotal.education.articulate.service.EnvironmentHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author mborges
 */
@RestController
public class ArticulateRestController {

	private final EnvironmentHelper environmentHelper;

	public ArticulateRestController(EnvironmentHelper environmentHelper) {
		this.environmentHelper = environmentHelper;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/bluegreen-check")
	public String bluegreenRequest() throws Exception {
	
		if (System.getenv("APP_VERSION") == null) {
			return "Version Not Available";
		}
		return System.getenv("APP_VERSION");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/bluegreen-check-appversion")
	public String bluegreenRequestAppversion() throws Exception {
		
		if (System.getenv("APP_VERSION") == null) {
			return "Version Not Available";
		}
		return System.getenv("APP_VERSION");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/bluegreen-check-hostname")
	public String bluegreenRequestHostname() throws Exception {
		
		if (System.getenv("HOSTNAME") == null) {
			return "Version Not Available";
		}
		return System.getenv("HOSTNAME");
	}
}
