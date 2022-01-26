//
//  Library1ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library1ViewController: UIViewController {

    //ボタン、ラベルの接続
        @IBOutlet weak var lib1Label: UILabel!
        @IBOutlet weak var lib11Button: UIButton!
        @IBOutlet weak var lib12Button: UIButton!
        @IBOutlet weak var lib13Button: UIButton!
        @IBOutlet weak var lib14Button: UIButton!
        @IBOutlet weak var backButton: UIButton!
     
    //画面遷移
        @IBAction func clickGo11(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library11 View Controller")as! Library11ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo12(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library12 View Controller")as! Library12ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo13(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library13 View Controller")as! Library13ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo14(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library14 View Controller")as! Library14ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGolibrary(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library View Controller")as! LibraryViewController
            self.present(next, animated: true, completion: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

    //ボタン、ラベルの表記設定
            lib11Button.setTitle("1.喫煙の有害性",for: .normal)
            lib12Button.setTitle("2.禁煙の困難性",for: .normal)
            lib13Button.setTitle("3.受動喫煙",for: .normal)
            lib14Button.setTitle("4.喫煙に対する世論",for: .normal)
            backButton.setTitle("×",for: .normal)
            lib1Label.text = "①喫煙に関する知識"
            
            
            // スクリーンサイズを取得
            let scrW:CGFloat = view.frame.size.width
            let scrH:CGFloat = view.frame.size.height
            view.backgroundColor = UIColor(hex:"e6e6e6")
            let bgUI = UIColor(hex:"008000")
            let liUI = UIColor(hex:"1c1d1c")
            let font = "Chalk-JP"
            if #available(iOS 15.0, *) {
                lib11Button.configuration = nil
                lib12Button.configuration = nil
                lib13Button.configuration = nil
                lib14Button.configuration = nil
                backButton.configuration = nil
            }
    //表題ラベルの表記設定
            lib1Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib1Label.center = CGPoint(x: scrW/2, y: scrH/8)
            lib1Label.textAlignment = NSTextAlignment.center
            lib1Label.font = UIFont(name:font, size: 40)
            lib1Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib1Label.layer.shadowOpacity = 0.4
            lib1Label.textColor = liUI
            let bFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
    //ボタン①の表記設定
            lib11Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib11Button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            lib11Button.layer.borderWidth = 2
            lib11Button.layer.borderColor = liUI.cgColor
            lib11Button.layer.cornerRadius = 10
            lib11Button.layer.shadowOffset = CGSize(width:6, height:6)
            lib11Button.layer.shadowOpacity = 0.5
            lib11Button.layer.shadowRadius = 10
            lib11Button.frame = bFrame
            lib11Button.center = CGPoint(x: scrW/2, y:scrH*49/180)
            lib11Button.titleLabel?.font = UIFont(name:font, size: 25)
     
    //ボタン②の表記設定
            lib12Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib12Button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            lib12Button.layer.borderWidth = 2
            lib12Button.layer.borderColor = liUI.cgColor
            lib12Button.layer.cornerRadius = 10
            lib12Button.layer.shadowOffset = CGSize(width:6, height:6)
            lib12Button.layer.shadowOpacity = 0.5
            lib12Button.layer.shadowRadius = 10
            lib12Button.frame = bFrame
            lib12Button.center = CGPoint(x: scrW/2, y:scrH*10759/24570)
            lib12Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン③の表記設定
            lib13Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib13Button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            lib13Button.layer.borderWidth = 2
            lib13Button.layer.borderColor = liUI.cgColor
            lib13Button.layer.cornerRadius = 10
            lib13Button.layer.shadowOffset = CGSize(width:6, height:6)
            lib13Button.layer.shadowOpacity = 0.5
            lib13Button.layer.shadowRadius = 10
            lib13Button.frame = bFrame
            lib13Button.center = CGPoint(x:scrW/2, y:scrH*29659/49140)
            lib13Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン④の表記設定
            lib14Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib14Button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            lib14Button.layer.borderWidth = 2
            lib14Button.layer.borderColor = liUI.cgColor
            lib14Button.layer.cornerRadius = 10
            lib14Button.layer.shadowOffset = CGSize(width:6, height:6)
            lib14Button.layer.shadowOpacity = 0.5
            lib14Button.layer.shadowRadius = 10
            lib14Button.frame = bFrame
            lib14Button.center = CGPoint(x:scrW/2, y:scrH/1.3)
            lib14Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //xボタン
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            backButton.layer.borderWidth = 2
            backButton.layer.borderColor = liUI.cgColor
            backButton.layer.cornerRadius = 30
            backButton.layer.shadowOffset = CGSize(width:6, height:6)
            backButton.layer.shadowOpacity = 0.5
            backButton.layer.shadowRadius = 10
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
}
