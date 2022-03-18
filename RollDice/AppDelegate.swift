//
//  AppDelegate.swift
//  RollDice
//
//  Created by riza erdi karakus on 14.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if true {
                   let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                   let logfileUrl = documentsUrl.appendingPathComponent("out.log")

                   logfileUrl.withUnsafeFileSystemRepresentation { path in
                       guard let path = path else {
                           return
                       }

                       //Path directory
                       print("Path directory: \(String(cString: path))")

                       let file = fopen(path, "a")
                       assert(file != nil, String(cString: strerror(errno)))
                       let fd = fileno(file)
                       assert(fd >= 0, String(cString: strerror(errno)))
                       let result1 = dup2(fd, STDERR_FILENO)
                       assert(result1 >= 0, String(cString: strerror(errno)))
                       let result2 = dup2(fd, STDOUT_FILENO)
                       assert(result2 >= 0, String(cString: strerror(errno)))

                       print("print:Log Test")
                   }
               }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

