//
//  ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var countDay: Int = 1
    var countPrice: Int = 0
    var buttonName = "START"
    var request:UNNotificationRequest!
    var requestF:UNNotificationRequest!
    let content = UNMutableNotificationContent()
    let contentF = UNMutableNotificationContent()
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
    let triggerF = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let dt = Date()
    let dateFormatter = DateFormatter()
   
    //ボタン、ラベルの接続
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var startDayLabel: UILabel!
    
    //トップ画面から各画面への画面遷移
    @IBAction func clickButtonGoGame(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let next = storyboard.instantiateViewController(withIdentifier:"Game View Controller")as! GameViewController
        self.present(next, animated: true, completion: nil)
    }
    
    @IBAction func clickButtonGoLibrary(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let next = storyboard.instantiateViewController(withIdentifier:"Library View Controller")as! LibraryViewController
        self.present(next, animated: true, completion: nil)
    }
    
    @IBAction func clickButtonGoSetting(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let next = storyboard.instantiateViewController(withIdentifier:"Setting View Controller")as! SettingViewController
        self.present(next, animated: true, completion: nil)
    }
    
    //startボタンの動作
    @IBAction func startCount(_ sender: Any) {

        if(buttonName == "COUNT"){
            //日数計測.金額計算
            self.countDay += 1
            self.countPrice += 308
            UserDefaults.standard.set(countDay,forKey: "total_day")
            UserDefaults.standard.set(countPrice,forKey: "price")
            self.timerLabel.text = String(format: "禁煙%d日目", UserDefaults.standard.integer(forKey: "total_day"))
            self.moneyLabel.text = String(format: "¥%d", UserDefaults.standard.integer(forKey: "price"))
            content.title = "Smoquit Notification"
            content.body = "禁煙\(countDay+1)日目です。カウントボタンを押して禁煙期間を記録しましょう！"
            content.sound = UNNotificationSound.default
            request = UNNotificationRequest(identifier: "TimeInterval", content: content, trigger: trigger)
            // 通知の登録
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            // DateFormatter を使用して書式とロケールを指定する
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
            startDayLabel.text = "更新日：\(dateFormatter.string(from: dt))"
            UserDefaults.standard.set(self.startDayLabel.text,forKey: "start_day")
        }
        else{
            //確認の表示
            let alert = UIAlertController(title: "確認", message: "スタートしますか？", preferredStyle: UIAlertController.Style.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self] (action: UIAlertAction!) -> Void in
                print("OK")
                //ボタンの利用可否を設定
                self.resetButton.isEnabled = true
                self.timerLabel.text = "禁煙1日目"
                self.moneyLabel.text = "¥0"
                self.buttonName = "COUNT"
                self.startButton.setTitle("COUNT", for: .normal)
                self.startButton.backgroundColor = UIColor(hex:"5801B4").withAlphaComponent(0.7)
                self.resetButton.backgroundColor = UIColor(hex:"008000").withAlphaComponent(0.7)
                self.resetButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
                //禁煙開始２日目の通知
                content.title = "Smoquit Notification"
                content.body = "禁煙2日目です。COUNTボタンを押して禁煙期間を記録しましょう❗️"
                content.sound = UNNotificationSound.default
                request = UNNotificationRequest(identifier: "TimeInterval", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                //トップ画面の使い方
                contentF.title = "Smoquit Notification"
                contentF.body = "1日ごとにCOUNTボタンを押して禁煙の記録をしましょう❗️"
                contentF.sound = UNNotificationSound.default
                requestF = UNNotificationRequest(identifier: "TimeIntervalF", content: contentF, trigger: triggerF)
                UNUserNotificationCenter.current().add(requestF, withCompletionHandler: nil)
                // DateFormatter を使用して書式とロケールを指定する
                dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
                startDayLabel.text = "更新日：\(dateFormatter.string(from: dt))"
                UserDefaults.standard.set(self.buttonName,forKey: "start_button")
                UserDefaults.standard.set(startButton.isEnabled,forKey: "start_button_enabled")
                UserDefaults.standard.set(self.startDayLabel.text,forKey: "start_day")
            })
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {(action: UIAlertAction!) -> Void in print("Cancel")
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["TimeInterval"])
                
            })
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            present(alert,animated: true, completion: nil)
        }
    }
    //resetボタンの動作
    @IBAction func resetCount(_ sender: Any) {
        
        //確認の表示
        let alert = UIAlertController(title: "確認", message: "本当にリセットしますか？", preferredStyle: UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self]  (action: UIAlertAction!) -> Void in
            print("OK")
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["TimeInterval"])

            self.startButton.isEnabled = true
            self.resetButton.isEnabled = false
            self.resetButton.backgroundColor = .gray.withAlphaComponent(0.7)
            self.countDay = 0
            self.countPrice = 0
            UserDefaults.standard.set(self.countDay,forKey: "total_day")
            UserDefaults.standard.set(self.countPrice,forKey: "price")
            self.timerLabel.text = "禁煙スタート"
            self.moneyLabel.text = "¥0"
            self.startButton.setTitle("START", for: .normal)
            self.buttonName = "START"
            self.startButton.backgroundColor = UIColor(hex:"008000").withAlphaComponent(0.7)
            self.startDayLabel.text = ""
            self.resetButton.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
            UserDefaults.standard.set(self.startDayLabel.text,forKey: "start_day")
            UserDefaults.standard.set(self.timerLabel.text,forKey: "timer_label")
            UserDefaults.standard.set(self.buttonName,forKey: "start_button")
            UserDefaults.standard.set(startButton.isEnabled,forKey: "start_button_enabled")
            UserDefaults.standard.set(moneyLabel.text,forKey: "money_label")
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {(action: UIAlertAction!) -> Void in print("Cancel")})
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert,animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(self.countDay,forKey: "total_day")
        UserDefaults.standard.set(self.countPrice,forKey: "price")
        UserDefaults.standard.set(self.buttonName,forKey: "start_button")
        self.buttonName = UserDefaults.standard.string(forKey: "start_button")!
        UserDefaults.standard.set(startButton.isEnabled,forKey: "start_button_enabled")
        startButton.isEnabled = UserDefaults.standard.bool(forKey: "start_button_enabled")
        UserDefaults.standard.set(timerLabel.text,forKey: "timer_label")
        timerLabel.text = UserDefaults.standard.string(forKey: "timer_label")
        UserDefaults.standard.set(moneyLabel.text,forKey: "money_label")
        moneyLabel.text = UserDefaults.standard.string(forKey: "money_label")
        UserDefaults.standard.set(self.startDayLabel.text,forKey: "start_day")
        startDayLabel.text = UserDefaults.standard.string(forKey: "start_day")
        // スクリーンサイズを取得
        let scrW:CGFloat = view.frame.size.width
        let scrH:CGFloat = view.frame.size.height
        let bgUI = UIColor(hex:"008000")
        view.backgroundColor = UIColor(hex:"e6e6e6")
        let liUI = UIColor(hex:"1c1d1c")
        let font = "Chalk-JP"
        let bFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
        //ボタンの初期状態を設定
        startButton.isEnabled = true
        resetButton.isEnabled = false
        
        //ラベル「禁煙から〜日経過」の表記設定
        timerLabel.frame = CGRect(x:0, y:0, width: scrW/1.2, height: scrH/4.5)
        timerLabel.center = CGPoint(x: scrW/2, y: scrH/5)
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.font = UIFont(name:font, size: 52)
        timerLabel.textColor = .white
        timerLabel.backgroundColor = bgUI.withAlphaComponent(0.5)
        timerLabel.layer.shadowOffset = CGSize(width:6, height:6)
        timerLabel.layer.shadowOpacity = 0.5
        timerLabel.layer.borderWidth = 2
        timerLabel.layer.borderColor = liUI.cgColor
        //更新日の設定
        startDayLabel.text = ""
        startDayLabel.frame = CGRect(x:0, y:0, width: scrW/2, height: scrH/15)
        startDayLabel.textAlignment = NSTextAlignment.center
        startDayLabel.center = CGPoint(x: scrW/1.55, y: scrH/3.5)
        startDayLabel.font = UIFont(name:font, size: 16)
        startDayLabel.textColor = .white
        //ラベル「節約金額」の表記設定
        saveLabel.frame = CGRect(x:0, y:scrH/3, width: scrW/3, height: scrH/17)
        saveLabel.center = CGPoint(x: scrW/4, y: scrH*50/136)
        saveLabel.textAlignment = NSTextAlignment.center
        saveLabel.font = UIFont(name:font, size: 20)
        saveLabel.textColor = .white
        saveLabel.backgroundColor = bgUI.withAlphaComponent(0.5)
        saveLabel.layer.shadowOffset = CGSize(width:6, height:6)
        saveLabel.layer.shadowOpacity = 0.5
        saveLabel.layer.borderColor = liUI.cgColor
        saveLabel.layer.borderWidth = 2
        //ラベル「￥〜」の表記設定
        moneyLabel.frame = CGRect(x:0, y:scrH/2.5, width: scrW/3, height: scrH/17)
        moneyLabel.center = CGPoint(x: scrW/4, y: scrH*58/136)
        moneyLabel.textAlignment = NSTextAlignment.center
        moneyLabel.font = UIFont(name:font, size: 22)
        moneyLabel.textColor = .white
        moneyLabel.backgroundColor = bgUI.withAlphaComponent(0.5)
        moneyLabel.layer.shadowOffset = CGSize(width:6, height: 6)  // 8
        moneyLabel.layer.shadowOpacity = 0.5
        moneyLabel.layer.borderColor = liUI.cgColor
        moneyLabel.layer.borderWidth = 2
        
        if #available(iOS 15.0, *) {
            startButton.configuration = nil
            resetButton.configuration = nil
            gameButton.configuration = nil
            libraryButton.configuration = nil
            settingButton.configuration = nil
        }
        //startボタンの設定
        startButton.backgroundColor = bgUI.withAlphaComponent(0.7)
        startButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = liUI.cgColor
        startButton.layer.cornerRadius = 10
        startButton.layer.shadowOffset = CGSize(width:6, height:6)
        startButton.layer.shadowOpacity = 0.3
        startButton.layer.shadowRadius = 3
        startButton.frame = CGRect(x: scrW/1.95, y: scrH/2.95, width:scrW/2.5, height:scrH/19)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        //resetボタンの設定
        resetButton.backgroundColor = .gray.withAlphaComponent(0.7)
        resetButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        resetButton.layer.borderWidth = 2
        resetButton.layer.borderColor = liUI.cgColor
        resetButton.layer.cornerRadius = 10
        resetButton.layer.shadowOffset = CGSize(width:6, height:6)
        resetButton.layer.shadowOpacity = 0.3
        resetButton.layer.shadowRadius = 3
        resetButton.frame = CGRect(x: scrW/1.95, y: scrH/2.48, width:scrW/2.5, height:scrH/19)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        resetButton.setTitleColor(.darkGray, for: UIControl.State.normal)
        
        //ゲームボタンの設定
        gameButton.backgroundColor = bgUI.withAlphaComponent(0.7)
        gameButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        gameButton.layer.borderWidth = 2
        gameButton.layer.borderColor = liUI.cgColor
        gameButton.layer.cornerRadius = 10
        gameButton.layer.shadowOffset = CGSize(width:6, height:6)
        gameButton.layer.shadowOpacity = 0.3
        gameButton.layer.shadowRadius = 3
        gameButton.frame = bFrame
        gameButton.center = CGPoint(x: scrW/2, y: scrH*0.55)
        gameButton.titleLabel?.font = UIFont(name:font, size: 25)
        //禁煙図書館ボタンの設定
        libraryButton.backgroundColor = bgUI.withAlphaComponent(0.7)
        libraryButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        libraryButton.layer.borderWidth = 2
        libraryButton.layer.borderColor = liUI.cgColor
        libraryButton.layer.cornerRadius = 10
        libraryButton.layer.shadowOffset = CGSize(width:6, height:6)
        libraryButton.layer.shadowOpacity = 0.3
        libraryButton.layer.shadowRadius = 3
        libraryButton.frame = bFrame
        libraryButton.center = CGPoint(x: scrW/2, y: scrH*3243/4520)
        libraryButton.titleLabel?.font = UIFont(name:font, size: 25)
        //設定ボタンの設定
        settingButton.backgroundColor = bgUI.withAlphaComponent(0.7)
        settingButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        settingButton.layer.borderWidth = 2
        settingButton.layer.borderColor = liUI.cgColor
        settingButton.layer.cornerRadius = 10
        settingButton.layer.shadowOffset = CGSize(width:6, height:6)
        settingButton.layer.shadowOpacity = 0.3
        settingButton.layer.shadowRadius = 3
        settingButton.frame = bFrame
        settingButton.center = CGPoint(x:scrW/2, y: scrH/1.13)
        settingButton.titleLabel?.font = UIFont(name:font, size:25)
        
        //ボタンの表記設定
        timerLabel.numberOfLines = 0
        moneyLabel.text = "¥0"
        timerLabel.text = "禁煙スタート"
        saveLabel.text = "節約金額"
        startButton.setTitle("START",for: .normal)
        resetButton.setTitle("RESET",for: .normal)
        gameButton.setTitle("ゲーム",for: .normal)
        libraryButton.setTitle("禁煙ライブラリ",for: .normal)
        settingButton.setTitle("設定",for: .normal)
        
    }
    
    
}

