//
//  ViewController.swift
//  ValidateIPAddress
//
//  Created by Utsha Guha on 24-4-18.
//  Copyright © 2018 Utsha Guha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let result = self.validIPAddress("00.0.0.0")
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validIPAddress(_ IP: String) -> String {
        var ipArray = IP.components(separatedBy: ".")
        if ipArray.count == 4 {
            // validate IPv4
            for i in 0..<ipArray.count{
                if Int(ipArray[i])==nil{
                    return "Neither"
                }
                if Int(ipArray[i])!>=0 && Int(ipArray[i])!<=255 {
                    if Int(ipArray[i]) == 0 && ipArray[i].characters.count>1 {
                        return "Neither"
                    }
                    for j in 0..<ipArray[i].characters.count{
                        let index = ipArray[i].index(ipArray[i].startIndex, offsetBy: j)
                        let firstCharacter = ipArray[i][index]
                        if firstCharacter != "0" {
                            if j>0 {
                                return "Neither"
                            }
                            break
                        }
                    }
                }
                else{
                    return "Neither"
                }
            }
            return "IPv4"
        }
        else{
            var ipArray2 = IP.components(separatedBy: ":")
            if ipArray2.count == 8 {
                // validate IPv6
                for i in 0..<ipArray2.count{
                    if (ipArray2[i].characters.count <= 4 && ipArray2[i].characters.count >= 1) || ipArray2[i] == "0"  {
                        let index = ipArray2[i].index(ipArray2[i].startIndex, offsetBy: 0)
                        let firstCharacter = ipArray2[i][index]
                        if firstCharacter == "-" {
                            return "Neither"
                        }
                        else{
                            if let num2 = Int(ipArray2[i], radix: 16) {
                                print(num2)
                            }
                            else{
                                return "Neither"
                            }
                        }
                       
                    }
                    else{
                            return "Neither"
                    }
                    }
                return "IPv6"
                }
            else{
            return "Neither"
            }
            }
    }

}

