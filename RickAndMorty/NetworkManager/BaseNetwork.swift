//
//  BaseNetwork.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import Foundation

struct BaseNetwork {
    let baseUrl = "https://rickandmortyapi.com/api"
    
    enum HTTPURLREsponse {
        case noData, badURLResponse
    }
    
    enum Endpoints: String {
        case getAllCharacters = "/character"
        case getLocation = "/location"
        case getEpisode = "/episode"

    }
    
    enum HTTPMethods: String {
        case GET = "get"
        case POST = "post"
        case Content = "application/json"
    }
    
    func getSessionCharacters(filter: String, page: Int, status: String?, species: String?) -> URLRequest? {
        guard let url = URL(string: "\(baseUrl)\(Endpoints.getAllCharacters.rawValue)") else { return nil }
        
        var urlComponets = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItems = [
            URLQueryItem(name: "page", value: page.formatted()),
            URLQueryItem(name: "status", value: status),
            URLQueryItem(name: "species", value: species),

            filter != "" ? URLQueryItem(name: "name", value: filter) : nil
        ].compactMap{$0}
        
        urlComponets?.queryItems = queryItems
        
        guard let urlWithParams = urlComponets?.url else { return nil }
        
        var request = URLRequest(url: urlWithParams)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue(HTTPMethods.Content.rawValue, forHTTPHeaderField: "Content-type")
        
        
        return request
        
    }
    
    func getSessionEpisodes(id: [String]) -> URLRequest? {
        
        
        guard let url = URL(string: "\(baseUrl)\(Endpoints.getEpisode.rawValue)/\(id)") else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue(HTTPMethods.Content.rawValue, forHTTPHeaderField: "Content-type")
        
        
        return request
    }
    
    func getSessionLocation(id: String) -> URLRequest? {
        
        
        guard let url = URL(string: "\(baseUrl)\(Endpoints.getLocation.rawValue)/\(id)") else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue(HTTPMethods.Content.rawValue, forHTTPHeaderField: "Content-type")
        
        
        return request
    }

}

