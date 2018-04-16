//
//  ViewController.swift
//  DatePickerTest
//
//  Created by D7703_04 on 2018. 4. 11..
//  Copyright © 2018년 D7703_04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in self.updateTime()})
    }
    
    @IBAction func ChangePick(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss EEE"
        lblPickerTime.text = formatter.string(from: datePickerView.date)
    }
    
    
    @objc func updateTime() {
        let date1 = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss EEE"
        let time1 = formatter.string(from: date1)
        lblCurrentTime.text = time1
        
        if lblPickerTime.text == lblCurrentTime.text {
            view.backgroundColor = UIColor.red
            let alertController = UIAlertController(title: "알람", message: "지정된시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("취소")
                
            }
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("확인")
                self.view.backgroundColor = UIColor.white
                
            }
            
            alertController.addAction(DestructiveAction)
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
            
        }
        }
        
    }
    
    

