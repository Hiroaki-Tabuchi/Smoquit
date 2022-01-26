//
//  Library2ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library2ViewController: UIViewController {

    //ボタン、ラベルの接続
        @IBOutlet weak var lib2Label: UILabel!
        @IBOutlet weak var lib21Button: UIButton!
        @IBOutlet weak var lib22Button: UIButton!
        @IBOutlet weak var lib23Button: UIButton!
        @IBOutlet weak var lib24Button: UIButton!
        @IBOutlet weak var backButton: UIButton!
        
    //画面遷移
        @IBAction func clickGo21(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library21 View Controller")as! Library21ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo22(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library22 View Controller")as! Library22ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo23(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library23 View Controller")as! Library23ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo24(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library24 View Controller")as! Library24ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGoLibrary(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library View Controller")as! LibraryViewController
            self.present(next, animated: true, completion: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

    //ボタン、ラベルの表記設定
            lib21Button.setTitle("1.禁煙方法について",for: .normal)
            lib22Button.setTitle("2.喫煙の代替行動",for: .normal)
            lib23Button.setTitle("3.禁煙後の体の変化",for: .normal)
            lib24Button.setTitle("4.禁煙のコツ",for: .normal)
            backButton.setTitle("×",for: .normal)
            lib2Label.text = "②禁煙に関する知識"
            
            // スクリーンサイズを取得
            let scrW:CGFloat = view.frame.size.width
            let scrH:CGFloat = view.frame.size.height
            view.backgroundColor = UIColor(hex:"e6e6e6")
            let bgUI = UIColor(hex:"008000")
            let liUI = UIColor(hex:"1c1d1c")
            let font = "Chalk-JP"
            let bFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
            if #available(iOS 15.0, *) {
                lib21Button.configuration = nil
                lib22Button.configuration = nil
                lib23Button.configuration = nil
                lib24Button.configuration = nil
                backButton.configuration = nil
            }
    //表題ラベルの表記設定
            lib2Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib2Label.center = CGPoint(x:scrW/2, y:scrH/8)
            lib2Label.textAlignment = NSTextAlignment.center
            lib2Label.font = UIFont(name:font, size:40)
            lib2Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib2Label.layer.shadowOpacity = 0.4
            lib2Label.textColor = liUI
    //ボタン①の表記設定
            lib21Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib21Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib21Button.layer.borderWidth = 2  // 5
            lib21Button.layer.borderColor = liUI.cgColor  // 6
            lib21Button.layer.cornerRadius = 10  // 7
            lib21Button.layer.shadowOffset = CGSize(width:6, height:6)
            lib21Button.layer.shadowOpacity = 0.5  // 9
            lib21Button.layer.shadowRadius = 10
            lib21Button.frame = bFrame
            lib21Button.center = CGPoint(x:scrW/2, y:scrH*49/180)
            lib21Button.titleLabel?.font = UIFont(name:font, size: 25)
     
    //ボタン②の表記設定
            lib22Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib22Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib22Button.layer.borderWidth = 2  // 5
            lib22Button.layer.borderColor = liUI.cgColor  // 6
            lib22Button.layer.cornerRadius = 10  // 7
            lib22Button.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            lib22Button.layer.shadowOpacity = 0.5  // 9
            lib22Button.layer.shadowRadius = 10
            lib22Button.frame = bFrame
            lib22Button.center = CGPoint(x:scrW/2, y:scrH*10759/24570)
            lib22Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン③の表記設定
            lib23Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib23Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib23Button.layer.borderWidth = 2  // 5
            lib23Button.layer.borderColor = liUI.cgColor  // 6
            lib23Button.layer.cornerRadius = 10  // 7
            lib23Button.layer.shadowOffset = CGSize(width: 3, height: 3 )  // 8
            lib23Button.layer.shadowOpacity = 0.5  // 9
            lib23Button.layer.shadowRadius = 10
            lib23Button.frame = bFrame
            lib23Button.center = CGPoint(x:scrW/2, y:scrH*29659/49140)
            lib23Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン④の表記設定
            lib24Button.backgroundColor = bgUI.withAlphaComponent(0.7)  // white button
            lib24Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib24Button.layer.borderWidth = 2  // 5
            lib24Button.layer.borderColor = liUI.cgColor  // 6
            lib24Button.layer.cornerRadius = 10  // 7
            lib24Button.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            lib24Button.layer.shadowOpacity = 0.5  // 9
            lib24Button.layer.shadowRadius = 10
            lib24Button.frame = bFrame
            lib24Button.center = CGPoint(x:scrW/2, y:scrH/1.3)
            lib24Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //xボタン
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)  // white button
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            backButton.layer.borderWidth = 2  // 5
            backButton.layer.borderColor = liUI.cgColor  // 6
            backButton.layer.cornerRadius = 30  // 7
            backButton.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            backButton.layer.shadowOpacity = 0.5  // 9
            backButton.layer.shadowRadius = 10
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }

}
