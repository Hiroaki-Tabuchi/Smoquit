//
//  LibraryViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class LibraryViewController: UIViewController {

    //ボタン、ラベルの接続
        @IBOutlet weak var libLabel: UILabel!
        @IBOutlet weak var lib1Button: UIButton!
        @IBOutlet weak var lib2Button: UIButton!
        @IBOutlet weak var backButton: UIButton!
        @IBOutlet weak var exLabel: UILabel!
    //画面遷移
        @IBAction func clickGo1(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library1 View Controller")as! Library1ViewController
            self.present(next, animated: true, completion: nil)
        }
        @IBAction func clickGo2(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library2 View Controller")as! Library2ViewController
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
            if #available(iOS 15.0, *) {
                lib1Button.configuration = nil
                lib2Button.configuration = nil
                backButton.configuration = nil
            }
    //ボタン、ラベルの表記設定
            lib1Button.setTitle("①喫煙に関する知識",for: .normal)
            lib2Button.setTitle("②禁煙に関する知識",for: .normal)
            backButton.setTitle("×",for: .normal)
            libLabel.text = "禁煙ライブラリ"
            exLabel.text = "喫煙・禁煙情報を閲覧できます"
            let lFrame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
    //ラベル「禁煙図書館」の表記設定
            libLabel.frame = CGRect(x:0, y:0, width: 300, height: 80)
            libLabel.center = CGPoint(x: scrW/2, y: scrH/8)
            libLabel.textAlignment = NSTextAlignment.center
            libLabel.font = UIFont(name:font, size: 40)
            libLabel.textColor = liUI
            libLabel.layer.shadowOffset = CGSize(width: 6, height: 6 )
            libLabel.layer.shadowOpacity = 0.4
    //説明ラベル
            exLabel.font = UIFont(name:font, size: 20)
            exLabel.frame = CGRect(x:0, y:0, width:300, height:40)
            exLabel.center = CGPoint(x: scrW/2, y: scrH/4.3)
            exLabel.textColor = liUI
            exLabel.layer.shadowOffset = CGSize(width: 6, height: 6 )
            exLabel.layer.shadowOpacity = 0.4
            exLabel.textAlignment = NSTextAlignment.center
    //ボタン「1.喫煙に関する知識」の表記設定
            lib1Button.backgroundColor =  bgUI.withAlphaComponent(0.7)
            lib1Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib1Button.layer.borderWidth = 2  // 5
            lib1Button.layer.borderColor = UIColor.black.cgColor  // 6
            lib1Button.layer.cornerRadius = 10  // 7
            lib1Button.layer.shadowOffset = CGSize(width: 3, height: 3 )  // 8
            lib1Button.layer.shadowOpacity = 0.5  // 9
            lib1Button.layer.shadowRadius = 10  // 10
            lib1Button.layer.shadowColor = UIColor.gray.cgColor  //11
            lib1Button.frame = lFrame
            lib1Button.center = CGPoint(x:scrW/2, y:scrH/2.35)
            lib1Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン「2.禁煙に関する知識」の表記設定
            lib2Button.backgroundColor = bgUI.withAlphaComponent(0.7)
            lib2Button.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            lib2Button.layer.borderWidth = 2  // 5
            lib2Button.layer.borderColor = liUI.cgColor  // 6
            lib2Button.layer.cornerRadius = 10  // 7
            lib2Button.layer.shadowOffset = CGSize(width: 6, height:6)  // 8
            lib2Button.layer.shadowOpacity = 0.5  // 9
            lib2Button.layer.shadowRadius = 10  // 10
            //lib2Button.layer.shadowColor = UIColor.gray.cgColor  //11
            lib2Button.frame = lFrame
            lib2Button.center = CGPoint(x:scrW/2, y:scrH/1.63)
            lib2Button.titleLabel?.font = UIFont(name:font, size: 25)
            
    //ボタン「戻る」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            backButton.layer.borderWidth = 2  // 5
            backButton.layer.borderColor = liUI.cgColor  // 6
            backButton.layer.cornerRadius = 30  // 7
            backButton.layer.shadowOffset = CGSize(width: 6, height:6)  // 8
            backButton.layer.shadowOpacity = 0.5  // 9
            backButton.layer.shadowRadius = 10  // 10
            backButton.layer.shadowColor = UIColor.gray.cgColor  //11
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
}
