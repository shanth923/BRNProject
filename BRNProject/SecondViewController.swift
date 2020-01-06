//
//  SecondViewController.swift
//  BRNProject
//
//  Created by R Shantha Kumar on 11/5/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
   
    
    
    var URLReqObject:URLRequest!
    var  dataTaskObj:URLSessionDataTask!
    
    
     var imageurl = ""
    
    
    var photo:UIImage?
    var totalDays:Int?
    var workingDays:Int?
    var totalLeaves:Int?
    var images:String?
//Outlets
    @IBOutlet weak var emailOutlet: UILabel!
    
    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var batchIDOutlet: UILabel!
    
    @IBOutlet weak var studentIDOutlet: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var totalDaysLbl: UILabel!
    @IBOutlet weak var workingDaysLbl: UILabel!
    @IBOutlet weak var leavesLbl: UILabel!
    @IBOutlet weak var abscentLbl: UILabel!
    @IBOutlet weak var daysAbscentlbl: UILabel!
    @IBOutlet weak var updatesSentLbl: UILabel!
    @IBOutlet weak var workingHrs: UILabel!
    @IBOutlet weak var workedaHrs: UILabel!
    @IBOutlet weak var overallSummury: UILabel!
    @IBOutlet weak var workerPerDay: UILabel!
    @IBOutlet weak var shortagePerDay: UILabel!
    @IBOutlet weak var lateOFOffice: UILabel!
    @IBOutlet weak var minimumHrs: UILabel!
    @IBOutlet weak var maximumHrs: UILabel!
    @IBOutlet weak var pointsEarned: UILabel!
    @IBOutlet weak var perfomanceScxore: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    let image = "https:www.brninfotech.com/pulse/modules"
    
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        
        
        nameOutlet.text = FormData.shared.data["firstName"]
        batchIDOutlet.text =  FormData.shared.data["batchID"]
        studentIDOutlet.text = FormData.shared.data["studentID"]
        emailOutlet.text = FormData.shared.data["registeredEmail"]
        
        
        
totalDaysLbl.text = String(FormData.shared.attendanceData[0]["totalDays"] as! Int)
workingDaysLbl.text = String(FormData.shared.attendanceData[0]["totalWorkingDays"] as! Int)
leavesLbl.text = String(FormData.shared.attendanceData[0]["totalLeaves"] as! Int)
abscentLbl.text = String(FormData.shared.attendanceData[0]["totalAbsents"] as! Int)
updatesSentLbl.text = String(FormData.shared.attendanceData[0]["totalUpdatesSent"] as! Int)
  daysAbscentlbl.text = String(FormData.shared.attendanceData[0]["totalDaysAttended"] as! Int)
 workingHrs.text = String(FormData.shared.attendanceData[0]["totalWorkingHours"] as! String)
 workedaHrs.text = String(FormData.shared.attendanceData[0]["totalWorkedHours"] as! String)
 shortagePerDay.text = String(FormData.shared.attendanceData[0]["totalShortageHours"] as! String)
overallSummury.text = String(FormData.shared.attendanceData[0]["numberOfTimesMinimumHoursMissed"] as! Int)
 workerPerDay.text = String(FormData.shared.attendanceData[0]["avgWorkingHours"] as! String)
shortagePerDay.text = String(FormData.shared.attendanceData[0]["avgShortageHours"] as! String)
 lateOFOffice.text = String(FormData.shared.attendanceData[0]["isAttendedToday"] as! Int)
 minimumHrs.text = String(FormData.shared.attendanceData[0]["numberOfTimesMinimumHoursMissed"] as! Int)
maximumHrs.text = String(FormData.shared.attendanceData[0]["maxPoints"] as! Int)
 pointsEarned.text = String(FormData.shared.attendanceData[0]["pointsScored"] as! Int)
        perfomanceScxore.text = String(FormData.shared.attendanceData[0]["percScored"] as! String)

        images=FormData.shared.data["profileImagePath"]
        
        //imageurl = image+images!
        print(imageurl)
        
        
       let newString = images!.replacingOccurrences(of: "..", with: image, options: .literal, range: nil)
        
        
        if let url  = URL(string: newString){
            
            
            do{
                
                let data = try Data(contentsOf: url)
                self.imageView.image = UIImage(data: data)
                
            }catch{
                
                
                print("something went wrong")
                
                
            }
        }
        
    
        
      
    }

}
