//
//  CryptoWorker.swift
//  CleanStore
//
//  Created by João Pedro Giarrante on 28/09/20.
//  Copyright © 2020 Clean Swift LLC. All rights reserved.
//

import Foundation

protocol CryptoWorkerDisplayLogic {
    func fetchCrypto(ticket: String, currency: String, completionHandler: @escaping (_ crypto: Crypto?,_ error: Error?) -> Void)
}

class CryptoWorker: CryptoWorkerDisplayLogic {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "5256247C-E5D3-4EAF-9678-8C01E87FB69C"
    
    
    func fetchCrypto(ticket: String, currency: String, completionHandler: @escaping (_ crypto: Crypto?,_ error: Error?) -> Void) {
        let urlString = "\(baseURL)\(ticket)/\(currency)?apiKey=\(apiKey)"
        
        performRequest(with: urlString) { (crypto, error) in
            DispatchQueue.main.async {
                completionHandler(crypto, error)
            }
        }
    }

    func performRequest(with urlString: String, completionHandler: @escaping (_ crypto: Crypto?,_ error: Error?) -> Void) {
        var urlFinalString = urlString
        
        // Treating Spaces
        if let noSpacesUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            urlFinalString = noSpacesUrlString
        }
        
        // 1. Create a URL
        if let url = URL(string: urlFinalString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a Task
            let task = session.dataTask(with: url) { (data, response, error) in
                // I am inside an Closure!
                if let safeError = error {
                    completionHandler(nil, safeError)
                    return
                }
                
                if let safeData = data {
                    // Explicit 'self' cause we are inside an Closure
                    if let crypto = self.parseJSON(safeData){
                        completionHandler(crypto, nil)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
        
    func parseJSON(_ cryptoData: Data) -> Crypto? {
        let decoder = JSONDecoder()
        do {
            // Using a Codable Struct to parse automatically
            let crypto = try decoder.decode(Crypto.self, from: cryptoData)
            return crypto
        } catch {
            return nil
        }
    }
}

