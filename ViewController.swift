//
//  ViewController.swift
//  dsssssss
//
//  Created by Other user on 4/28/18.
//  Copyright © 2018 Other user. All rights reserved.
//************** Abdelrhman ***************

import UIKit

class ViewController: UIViewController {
typealias stan = Dictionary<String,AnyObject>
    @IBOutlet weak var tex: UITextField!
    @IBOutlet weak var lab1: UILabel!
    
    @IBAction func but(_ sender: UIButton) {
        
        // Do any additional setup after loading the view,  a nib.
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q= " + tex.text! + ",uk&appid=35c60f7896a601d48930472b8383c48f")!
        let task = URLSession.shared.dataTask(with: url){
            (data,response,error) in
            if error != nil {
                print (error!)
            }
            else {
                if let urlContent = data {
                    do{
                        let jsonres=try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                        let res=jsonres as? Dictionary<String,AnyObject>
                        //print(res!)
                        //print(res!["name"]!)
                        //print(res!["main"]!)
                        var arr:[stan]=res!["weather"] as! [stan]
                        if let dd=arr[0]["description"] as? String{
                            print(dd)
                            DispatchQueue.main.sync(execute: {
                                self.lab1.text = dd
                            })
                            
                        }
                        
                    }
                    catch {
                        print("Error")
                    }
                }
            }
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

