package com.services;

import com.beans.Ville;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class VilleService {
	private static final String API_URL_villes = "http://localhost:8081/villes";
	private static final String API_URL_villeByName = "http://localhost:8081/villes";

	public List<Ville> getAllVilles() throws Exception {
	    List<Ville> villes = new ArrayList<>();
	    try (CloseableHttpClient client = HttpClients.createDefault()) {
	        HttpGet request = new HttpGet(API_URL_villes);
	        try (CloseableHttpResponse response = client.execute(request)) {
	            String json = EntityUtils.toString(response.getEntity());
	            JSONArray jsonArray = new JSONArray(json);
	            for (int i = 0; i < jsonArray.length(); i++) {
	                JSONObject jsonObject = jsonArray.getJSONObject(i);
	                Ville ville = new Ville();
	                ville.setCodeCommune(jsonObject.optString("codeCommune", "Pas d'information"));
	                ville.setNomCommune(jsonObject.optString("nom", "Pas d'information"));
	                ville.setCodePostale(jsonObject.optString("codePostal", "Pas d'information"));
	                ville.setLatitude(jsonObject.optString("latitude", "Pas d'information"));
	                ville.setLongitude(jsonObject.optString("longitude", "Pas d'information"));
	                villes.add(ville);
	            }
	        }
	    }
	    return villes;
	}


	public double getLatitude(String villeDepart) throws IOException {
	    try (CloseableHttpClient client = HttpClients.createDefault()) {
	        HttpGet request = new HttpGet(API_URL_villeByName + "/" + villeDepart);
	        try (CloseableHttpResponse response = client.execute(request)) {
	            String json = EntityUtils.toString(response.getEntity());
	            JSONObject obj = new JSONObject(json);
	            return obj.getDouble("latitude");
	        }
	    }
	}

	public double getLongitude(String villeDepart) throws IOException {
	    try (CloseableHttpClient client = HttpClients.createDefault()) {
	        HttpGet request = new HttpGet(API_URL_villeByName + "/" + villeDepart);
	        try (CloseableHttpResponse response = client.execute(request)) {
	            String json = EntityUtils.toString(response.getEntity());
	            JSONObject obj = new JSONObject(json);
	            return obj.getDouble("longitude");
	        }
	    }
	}

	



}
