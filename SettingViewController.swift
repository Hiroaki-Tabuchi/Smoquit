//
//  SettingViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class SettingViewController: UIViewController {
    //ボタン、ラベルの接続
        @IBOutlet weak var settingLabel: UILabel!
        @IBOutlet weak var decButton: UIButton!
        @IBOutlet weak var csButton: UIButton!
        @IBOutlet weak var SNSButton: UIButton!
        @IBOutlet weak var backButton: UIButton!

    //画面遷移
        @IBAction func clickGoDeclare(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Declaration View Controller")as! DeclarationViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGoCigarStop(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"CigarStop View Controller")as! CigarStopViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGoSNS(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"SNS View Controller")as! SNSViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGoTop(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"View Controller")as! ViewController
            self.present(next, animated: true, completion: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // スクリーンサイズを取得
            let scrW:CGFloat = view.frame.size.width
            let scrH:CGFloat = view.frame.size.height
            let bgUI = UIColor(hex:"008000")
            self.view.backgroundColor = UIColor(hex: "e6e6e6")
            let liUI = UIColor(hex:"1c1d1c")
            let font = "Chalk-JP"

    //ボタン、ラベルの表記設定
            decButton.setTitle("禁煙宣言",for: .normal)
            csButton.setTitle("シガーストップ",for: .normal)
            SNSButton.setTitle("SNS共有",for: .normal)
            backButton.setTitle("×",for: .normal)
            settingLabel.text = "設定"
            let bFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
            
    //ラベル「設定」の表記設定
            settingLabel.frame = CGRect(x:0, y:0, width: 300, height: 80)
            settingLabel.center = CGPoint(x:scrW/2, y:scrH/8)
            // テキストを中央寄せ
            settingLabel.textAlignment = NSTextAlignment.center
            settingLabel.font = UIFont(name: font, size: 50)
            
            if #available(iOS 15.0, *) {
                decButton.configuration = nil
                csButton.configuration = nil
                SNSButton.configuration = nil
                backButton.configuration = nil
            }
            
    //ボタン「禁煙宣言」の表記設定
            decButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            decButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            decButton.layer.borderWidth = 2
            decButton.layer.borderColor = liUI.cgColor
            decButton.layer.cornerRadius = 10
            decButton.layer.shadowOffset = CGSize(width: 6, height: 6)
            decButton.layer.shadowOpacity = 0.5
            decButton.layer.shadowRadius = 10
            decButton.layer.borderWidth = 2
            decButton.layer.borderColor = liUI.cgColor
            decButton.frame = bFrame
            decButton.center = CGPoint(x: scrW/2, y: scrH*4.5/14)
            decButton.titleLabel?.font = UIFont(name:font, size:25)
    //ボタン「シガーストップ」の表記設定
            csButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            csButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            csButton.layer.borderWidth = 2
            csButton.layer.borderColor = liUI.cgColor
            csButton.layer.cornerRadius = 10
            csButton.layer.shadowOffset = CGSize(width: 6, height:6)
            csButton.layer.shadowOpacity = 0.5
            csButton.layer.shadowRadius = 10
            csButton.layer.borderWidth = 2
            csButton.layer.borderColor = liUI.cgColor
            csButton.frame = bFrame
            csButton.center = CGPoint(x: scrW/2, y:scrH/2)
            csButton.titleLabel?.font = UIFont(name:font, size:25)
    //ボタン「SNS共有」の表記設定
            SNSButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            SNSButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            SNSButton.layer.borderWidth = 2
            SNSButton.layer.borderColor = liUI.cgColor
            SNSButton.layer.cornerRadius = 10
            SNSButton.layer.shadowOffset = CGSize(width:6, height:6)
            SNSButton.layer.shadowOpacity = 0.5
            SNSButton.layer.shadowRadius = 10
            SNSButton.layer.borderWidth = 2
            SNSButton.layer.borderColor = liUI.cgColor
            SNSButton.frame = bFrame
            SNSButton.center = CGPoint(x: scrW/2, y:scrH*9.5/14)
            SNSButton.titleLabel?.font = UIFont(name:font, size: 25)
    //ボタン「戻る」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            backButton.layer.borderWidth = 2
            backButton.layer.borderColor = liUI.cgColor
            backButton.layer.cornerRadius = 30
            backButton.layer.shadowOffset = CGSize(width: 6, height:6)
            backButton.layer.shadowOpacity = 0.5
            backButton.layer.shadowRadius = 10
            backButton.layer.borderWidth = 2
            backButton.layer.borderColor = liUI.cgColor
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }

}
