//
//  ConnectionManager.swift
//  FoodApp
//
//  Created by Lyes ATEK on 14/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation
import Network

class ConnectionManager{
    static var shared  : ConnectionManager = ConnectionManager()
    
    var isConnected : Bool = false
    func testIfIsConnected(){
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.isConnected = true
            } else {
                print("There's no internet connection.")
                self.isConnected = false
            }
        }
        monitor.start(queue: queue)
    }
    
    
}
