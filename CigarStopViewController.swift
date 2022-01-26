//
//  CigarStopViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit
import CoreData
import UserNotifications

class CigarStopViewController: UIViewController {


    var request1:UNNotificationRequest!
    var request2:UNNotificationRequest!
    var request3:UNNotificationRequest!
    var request4:UNNotificationRequest!
    var request5:UNNotificationRequest!
    
    var dP1: UIDatePicker = UIDatePicker()
    var dP2: UIDatePicker = UIDatePicker()
    var dP3: UIDatePicker = UIDatePicker()
    var dP4: UIDatePicker = UIDatePicker()
    var dP5: UIDatePicker = UIDatePicker()
    
    let content = UNMutableNotificationContent()
    var trigger1 = UNCalendarNotificationTrigger(dateMatching: DateComponents(month:1, day:1, hour:24, minute:00), repeats: false)
    var trigger2 = UNCalendarNotificationTrigger(dateMatching: DateComponents(month:1, day:1, hour:24, minute:00), repeats: false)
    var trigger3 = UNCalendarNotificationTrigger(dateMatching: DateComponents(month:1, day:1, hour:24, minute:00), repeats: false)
    var trigger4 = UNCalendarNotificationTrigger(dateMatching: DateComponents(month:1, day:1, hour:24, minute:00), repeats: false)
    var trigger5 = UNCalendarNotificationTrigger(dateMatching: DateComponents(month:1, day:1, hour:24, minute:00), repeats: false)
    
//ボタン、ラベルなどの接続
    @IBOutlet var cigarstopLabel: UILabel!
    @IBOutlet weak var timer1: UITextField!
    @IBOutlet weak var timer2: UITextField!
    @IBOutlet weak var timer3: UITextField!
    @IBOutlet weak var timer4: UITextField!
    @IBOutlet weak var timer5: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var S1: UISwitch!
    @IBOutlet weak var S2: UISwitch!
    @IBOutlet weak var S3: UISwitch!
    @IBOutlet weak var S4: UISwitch!
    @IBOutlet weak var S5: UISwitch!
    @IBOutlet weak var csFrame1: UILabel!
    @IBOutlet weak var csFrame2: UILabel!
    @IBOutlet weak var csFrame3: UILabel!
    @IBOutlet weak var csFrame4: UILabel!
    @IBOutlet weak var csFrame5: UILabel!
    @IBOutlet weak var exLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // スクリーンサイズを取得
        let scrW:CGFloat = view.frame.size.width
        let scrH:CGFloat = view.frame.size.height
        let bgUI = UIColor(hex:"008000")
        self.view.backgroundColor = UIColor(hex: "e6e6e6")
        let liUI = UIColor(hex:"1c1d1c")
        let font = "Chalk-JP"
        if #available(iOS 15.0, *) {
            backButton.configuration = nil
        }
        content.title = "Smoquit Notification"
        content.body = "喫煙欲求に負けないように頑張りましょう❗️"
        content.sound = UNNotificationSound.default
        
//ボタン、ラベルの表記設定
        backButton.setTitle("×",for: .normal)
        cigarstopLabel.text = "シガーストップ"
        exLabel.text = "喫煙しやすい時間に通知できます"
        exLabel.font = UIFont(name:font, size: 25)
        exLabel.frame = CGRect(x:0, y:0, width:400, height:40)
        exLabel.center = CGPoint(x: scrW/1.9, y: scrH/4.5)
        exLabel.textColor = liUI
        exLabel.layer.shadowOffset = CGSize(width:6, height:6)
        exLabel.layer.shadowOpacity = 0.4
        
//ラベル「シガーストップ」の表記設定
        cigarstopLabel.frame = CGRect(x:0, y:0, width:400, height:80)
        cigarstopLabel.center = CGPoint(x: scrW/2, y: scrH/8)
        cigarstopLabel.textAlignment = NSTextAlignment.center// テキストを中央寄せ
        cigarstopLabel.font = UIFont(name:font, size: 50)
        cigarstopLabel.textColor = liUI
        cigarstopLabel.layer.shadowOffset = CGSize(width:6, height:6)
        cigarstopLabel.layer.shadowOpacity = 0.5
 
//タイマー枠
        let csFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/9)
        let cgFbgC = bgUI.withAlphaComponent(0.7)
        csFrame1.frame = csFrame
        csFrame1.center = CGPoint(x:scrW/2, y:scrH*38/117)
        csFrame1.backgroundColor = cgFbgC
        csFrame1.layer.borderColor = liUI.cgColor
        csFrame1.layer.borderWidth = 2
        csFrame2.frame = csFrame
        csFrame2.center = CGPoint(x:scrW/2, y:scrH*51/117)
        csFrame2.backgroundColor = cgFbgC
        csFrame2.layer.borderColor = liUI.cgColor
        csFrame2.layer.borderWidth = 2
        csFrame3.frame = csFrame
        csFrame3.center = CGPoint(x:scrW/2, y:scrH*64/117)
        csFrame3.backgroundColor = cgFbgC
        csFrame3.layer.borderColor = liUI.cgColor
        csFrame3.layer.borderWidth = 2
        csFrame4.frame = csFrame
        csFrame4.center = CGPoint(x:scrW/2, y:scrH*77/117)
        csFrame4.backgroundColor = cgFbgC
        csFrame4.layer.borderColor = liUI.cgColor
        csFrame4.layer.borderWidth = 2
        csFrame5.frame = csFrame
        csFrame5.center = CGPoint(x:scrW/2, y:scrH/1.3)
        csFrame5.backgroundColor = cgFbgC
        csFrame5.layer.borderColor = liUI.cgColor
        csFrame5.layer.borderWidth = 2
        csFrame1.text = ""
        csFrame2.text = ""
        csFrame3.text = ""
        csFrame4.text = ""
        csFrame5.text = ""
        
//Timerの設定
        let tFrame = CGRect(x:0, y:0, width:scrW/2.3, height:scrH/13)
        timer1.frame = tFrame
        timer1.center = CGPoint(x:scrW/2.7, y:scrH*38/117)
        timer1.backgroundColor = .white
        timer2.frame = tFrame
        timer2.center = CGPoint(x:scrW/2.7, y:scrH*51/117)
        timer2.backgroundColor = .white
        timer3.frame = tFrame
        timer3.center = CGPoint(x:scrW/2.7, y:scrH*64/117)
        timer3.backgroundColor = .white
        timer4.frame = tFrame
        timer4.center = CGPoint(x:scrW/2.7, y:scrH*77/117)
        timer4.backgroundColor = .white
        timer5.frame = tFrame
        timer5.center = CGPoint(x:scrW/2.7, y:scrH/1.3)
        timer5.backgroundColor = .white
        
//スイッチの表記設定
        S1.center = CGPoint(x:scrW/1.3, y:scrH*38/117)
        S2.center = CGPoint(x:scrW/1.3, y:scrH*51/117)
        S3.center = CGPoint(x:scrW/1.3, y:scrH*64/117)
        S4.center = CGPoint(x:scrW/1.3, y:scrH*77/117)
        S5.center = CGPoint(x:scrW/1.3, y:scrH/1.3)
        S1.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        S2.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        S3.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        S4.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        S5.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
//ボタン「戻る」の表記設定
        backButton.backgroundColor = bgUI.withAlphaComponent(0.7)
        backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = liUI.cgColor
        //サイズ/2
        backButton.layer.cornerRadius = 30
        backButton.layer.shadowOffset = CGSize(width: 10, height: 10 )
        backButton.layer.shadowOpacity = 0.5
        backButton.layer.shadowRadius = 10
        //backButton.layer.shadowColor = UIColor.gray.cgColor  //11
        //ポジションを真ん中に
        backButton.frame = CGRect(x:0, y:0, width:60, height:60)
        backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)

        // ピッカー設定
        if #available(iOS 13.4, *) {
            dP1.preferredDatePickerStyle = .wheels
            dP2.preferredDatePickerStyle = .wheels
            dP3.preferredDatePickerStyle = .wheels
            dP4.preferredDatePickerStyle = .wheels
            dP5.preferredDatePickerStyle = .wheels
        }
        dP1.datePickerMode = UIDatePicker.Mode.dateAndTime
        dP1.timeZone = NSTimeZone.local
        dP1.locale = Locale.current
        dP2.datePickerMode = UIDatePicker.Mode.dateAndTime
        dP2.timeZone = NSTimeZone.local
        dP2.locale = Locale.current
        dP3.datePickerMode = UIDatePicker.Mode.dateAndTime
        dP3.timeZone = NSTimeZone.local
        dP3.locale = Locale.current
        dP4.datePickerMode = UIDatePicker.Mode.dateAndTime
        dP4.timeZone = NSTimeZone.local
        dP4.locale = Locale.current
        dP5.datePickerMode = UIDatePicker.Mode.dateAndTime
        dP5.timeZone = NSTimeZone.local
        dP5.locale = Locale.current
        timer1.inputView = dP1
        timer2.inputView = dP2
        timer3.inputView = dP3
        timer4.inputView = dP4
        timer5.inputView = dP5
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x:0, y:0, width:scrW, height:35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
        timer1.inputView = dP1
        timer1.inputAccessoryView = toolbar
        
        timer2.inputView = dP2
        timer2.inputAccessoryView = toolbar
        
        timer3.inputView = dP3
        timer3.inputAccessoryView = toolbar
        
        timer4.inputView = dP4
        timer4.inputAccessoryView = toolbar
        
        timer5.inputView = dP5
        timer5.inputAccessoryView = toolbar
    }
    
    // 決定ボタン押下
    @objc func done() {
        
        timer1.endEditing(true)
        timer2.endEditing(true)
        timer3.endEditing(true)
        timer4.endEditing(true)
        timer5.endEditing(true)

        // 日付のフォーマット
        let formatter1 = DateFormatter()
        let formatterM1 = DateFormatter()
        let formatterD1 = DateFormatter()
        let formatterH1 = DateFormatter()
        let formatterm1 = DateFormatter()

        formatter1.dateFormat = "MM/dd HH:mm"
        formatterM1.dateFormat = "MM"
        formatterD1.dateFormat = "dd"
        formatterH1.dateFormat = "HH"
        formatterm1.dateFormat = "mm"
        let fM1 = Int(formatterM1.string(from: dP1.date))
        let fD1 = Int(formatterD1.string(from: dP1.date))
        let fH1 = Int(formatterH1.string(from: dP1.date))
        let fm1 = Int(formatterm1.string(from: dP1.date))
        let triggerDate1 = DateComponents(month:fM1, day:fD1, hour:fH1, minute:fm1)
        trigger1 = UNCalendarNotificationTrigger(dateMatching: triggerDate1, repeats: false)
        UserDefaults.standard.set(formatter1.string(from: dP1.date), forKey: "t1")
        timer1.text = UserDefaults.standard.string(forKey: "t1")
        
        let formatter2 = DateFormatter()
        let formatterM2 = DateFormatter()
        let formatterD2 = DateFormatter()
        let formatterH2 = DateFormatter()
        let formatterm2 = DateFormatter()
        formatter2.calendar = Calendar(identifier: .gregorian)
        formatter2.dateFormat = "MM/dd HH:mm"
        formatterM2.dateFormat = "MM"
        formatterD2.dateFormat = "dd"
        formatterH2.dateFormat = "HH"
        formatterm2.dateFormat = "mm"
        let fM2 = Int(formatterM2.string(from: dP2.date))
        let fD2 = Int(formatterD2.string(from: dP2.date))
        let fH2 = Int(formatterH2.string(from: dP2.date))
        let fm2 = Int(formatterm2.string(from: dP2.date))
        let triggerDate2 = DateComponents(month:fM2, day:fD2, hour:fH2, minute:fm2)
        trigger2 = UNCalendarNotificationTrigger(dateMatching: triggerDate2, repeats: false)
        UserDefaults.standard.set(formatter2.string(from: dP2.date), forKey: "t2")
        timer2.text = UserDefaults.standard.string(forKey: "t2")
        
        let formatter3 = DateFormatter()
        let formatterM3 = DateFormatter()
        let formatterD3 = DateFormatter()
        let formatterH3 = DateFormatter()
        let formatterm3 = DateFormatter()
        formatter3.calendar = Calendar(identifier: .gregorian)
        formatter3.dateFormat = "MM/dd HH:mm"
        formatterM3.dateFormat = "MM"
        formatterD3.dateFormat = "dd"
        formatterH3.dateFormat = "HH"
        formatterm3.dateFormat = "mm"
        let fM3 = Int(formatterM3.string(from: dP3.date))
        let fD3 = Int(formatterD3.string(from: dP3.date))
        let fH3 = Int(formatterH3.string(from: dP3.date))
        let fm3 = Int(formatterm3.string(from: dP3.date))
        let triggerDate3 = DateComponents(month:fM3, day:fD3, hour:fH3, minute:fm3)
        trigger3 = UNCalendarNotificationTrigger(dateMatching: triggerDate3, repeats: false)
        UserDefaults.standard.set(formatter3.string(from: dP3.date), forKey: "t3")
        timer3.text = UserDefaults.standard.string(forKey: "t3")
        
        let formatter4 = DateFormatter()
        let formatterM4 = DateFormatter()
        let formatterD4 = DateFormatter()
        let formatterH4 = DateFormatter()
        let formatterm4 = DateFormatter()
        formatter4.calendar = Calendar(identifier: .gregorian)
        formatter4.dateFormat = "MM/dd HH:mm"
        formatterM4.dateFormat = "MM"
        formatterD4.dateFormat = "dd"
        formatterH4.dateFormat = "HH"
        formatterm4.dateFormat = "mm"
        let fM4 = Int(formatterM4.string(from: dP4.date))
        let fD4 = Int(formatterD4.string(from: dP4.date))
        let fH4 = Int(formatterH4.string(from: dP4.date))
        let fm4 = Int(formatterm4.string(from: dP4.date))
        let triggerDate4 = DateComponents(month:fM4, day:fD4, hour:fH4, minute:fm4)
        trigger4 = UNCalendarNotificationTrigger(dateMatching: triggerDate4, repeats: false)
        UserDefaults.standard.set(formatter4.string(from: dP4.date), forKey: "t4")
        timer4.text = UserDefaults.standard.string(forKey: "t4")
        
        let formatter5 = DateFormatter()
        let formatterM5 = DateFormatter()
        let formatterD5 = DateFormatter()
        let formatterH5 = DateFormatter()
        let formatterm5 = DateFormatter()
        formatter5.calendar = Calendar(identifier: .gregorian)
        formatter5.dateFormat = "MM/dd HH:mm"
        formatterM5.dateFormat = "MM"
        formatterD5.dateFormat = "dd"
        formatterH5.dateFormat = "HH"
        formatterm5.dateFormat = "mm"
        let fM5 = Int(formatterM5.string(from: dP5.date))
        let fD5 = Int(formatterD5.string(from: dP5.date))
        let fH5 = Int(formatterH5.string(from: dP5.date))
        let fm5 = Int(formatterm5.string(from: dP5.date))
        let triggerDate5 = DateComponents(month:fM5, day:fD5, hour:fH5, minute:fm5, second:00)
        trigger5 = UNCalendarNotificationTrigger(dateMatching: triggerDate5, repeats: false)
        UserDefaults.standard.set(formatter5.string(from: dP5.date), forKey: "t5")
        timer5.text = UserDefaults.standard.string(forKey: "t5")
        
    }
    
    //画面遷移
        @IBAction func clickGoTop(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Setting View Controller")as! SettingViewController
            self.present(next, animated: true, completion: nil)
        }

//通知機能のON,OFF

    @IBAction func switch1(_ sender: UISwitch) {
        if sender.isOn{
         // 通知リクエストの作成
         request1 = UNNotificationRequest(
                    identifier: "CalendarNotification1",
                    content: content,
                    trigger: trigger1)
         // 通知リクエストの登録
         let center = UNUserNotificationCenter.current()
         center.add(request1, withCompletionHandler: nil)
        }else{
            // 通知リクエストの削除
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: ["CalendarNotification1"])
        }
    }
    
    @IBAction func switch2(_ sender: UISwitch) {
        if sender.isOn{
         // 通知リクエストの作成
         request2 = UNNotificationRequest(
                    identifier: "CalendarNotification2",
                    content: content,
                    trigger: trigger2)
         // 通知リクエストの登録
         let center = UNUserNotificationCenter.current()
         center.add(request2, withCompletionHandler: nil)
        }else{
            // 通知リクエストの削除
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: ["CalendarNotification2"])
        }
    }
    
    @IBAction func switch3(_ sender: UISwitch) {
        if sender.isOn{
         // 通知リクエストの作成
         request3 = UNNotificationRequest(
                    identifier: "CalendarNotification3",
                    content: content,
                    trigger: trigger3)
         // 通知リクエストの登録
         let center = UNUserNotificationCenter.current()
         center.add(request3, withCompletionHandler: nil)
        }else{
            // 通知リクエストの削除
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: ["CalendarNotification3"])
        }
    }
    
    @IBAction func switch4(_ sender: UISwitch) {
        if sender.isOn{
         // 通知リクエストの作成
         request4 = UNNotificationRequest(
                    identifier: "CalendarNotification4",
                    content: content,
                    trigger: trigger4)
         // 通知リクエストの登録
         let center = UNUserNotificationCenter.current()
         center.add(request4, withCompletionHandler: nil)
        }else{
            // 通知リクエストの削除
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: ["CalendarNotification4"])
        }
    }
    
    @IBAction func switch5(_ sender: UISwitch) {
        if sender.isOn{
         // 通知リクエストの作成
         request5 = UNNotificationRequest(
                    identifier: "CalendarNotification5",
                    content: content,
                    trigger: trigger5)
         // 通知リクエストの登録
         let center = UNUserNotificationCenter.current()
         center.add(request5, withCompletionHandler: nil)
        }else{
            // 通知リクエストの削除
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: ["CalendarNotification5"])
        }
    }

}
