//
//  ViewController.swift
//  BRNProject
//
//  Created by R Shantha Kumar on 11/2/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import TextFieldEffects

class ViewController: UIViewController {

  
    var urlRequest:URLRequest!
    var urlDataTask:URLSessionDataTask!
    var data = [String:String]()
    var attendanceFormat = [[String:Any]]()
  
    @IBOutlet weak var emailText: HoshiTextField!
    @IBOutlet weak var passwordText: HoshiTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attendanceDetails()
    }
    
    
    
   
    @IBAction func loginDetails(_ sender: Any) {
        
        if(emailText.text!.count < 1 && passwordText.text!.count < 1){
            
            
            let controller = UIAlertController.init(title: "warning", message: "incorrect login details", preferredStyle: UIAlertController.Style.alert)
            
            let action = UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default) { (cancel) in
                
            }
            
            controller.addAction(action)
            
            present(controller, animated: true, completion: nil)
            
        }else{
            
            data = BRNData()
            
            print(data)
            
            attendanceFormat = attendanceDetails()
            
            print(attendanceFormat)
            
            let targetVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
            
            present(targetVC, animated: true, completion: nil)
            
            
           
        }
        
        
        
        }
        
        
        
       
    
  
    
    func BRNData()-> [String:String]{
    
        var convertedData:[String:String]?
        
        urlRequest = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        
        urlRequest.httpMethod = "POST"
        
    
         let dataToSend =  "registeredEmail=\(emailText.text!)&registeredPassword=\(passwordText.text!)&funcName=verifyLogin"
        
        urlRequest.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        urlDataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, URLResponse, Error) in
            
            print("got data")
            do{
                 convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                
               
                
            }
            
            catch{
                
                print("something went wrong")
                
            }
            
        })
        urlDataTask.resume()
        
        
        while(convertedData == nil)
        {
            
        }
        
        FormData.shared.data=convertedData!
        return convertedData!
    }
    
    
    
    
    func attendanceDetails() -> [[String:Any]]{
        
        var covertedDatas:[[String:Any]]?
        urlRequest = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        urlRequest.httpMethod="POST"
        let  dataToSend="funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        urlRequest.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        urlDataTask = URLSession.shared.dataTask(with:urlRequest,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                covertedDatas = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                
               
            }catch
            {
                print("something went wrong")
            }
            
        })
        urlDataTask.resume()
        
        while (covertedDatas == nil) {
            
        }
        FormData.shared.attendanceData = covertedDatas!
        return covertedDatas!
    }
    
    
    
    
    
    


}

