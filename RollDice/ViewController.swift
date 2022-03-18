//
//  ViewController.swift
//  RollDice
//
//  Created by riza erdi karakus on 14.03.2022.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFileFromDocumentDirectory()
    }
    
    //Question 4
    /// Read from out.log file
    /// Main logic in AppDelegate folder
    func readFileFromDocumentDirectory(){
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let logfileUrl = documentsUrl.appendingPathComponent("out.log")
        
        if FileManager.default.fileExists(atPath: logfileUrl.path) {
            if let logString = try? String(contentsOf: logfileUrl, encoding: .utf8){
                logTextView.text = logString
            }
        }
    }
}
