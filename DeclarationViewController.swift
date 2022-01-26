//
//  DeclarationViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit
import CoreData

class DeclarationViewController: UIViewController {

    //ボタン、ラベルの接続
        @IBOutlet weak var decLabel: UILabel!
        @IBOutlet var exLabel: UILabel!
        @IBOutlet var selfDec: UITextField!
        @IBOutlet var saveButton: UIButton!
        @IBOutlet weak var backButton: UIButton!
        @IBOutlet var decText: UILabel!
    @IBOutlet var tapText: UITapGestureRecognizer!
    
    //画面遷移
        @IBAction func backTop(_ sender: Any) {
                let storyboard: UIStoryboard = self.storyboard!
                let next = storyboard.instantiateViewController(withIdentifier:"Setting View Controller")as! SettingViewController
                self.present(next, animated: true, completion: nil)
            }
    //ボタン押下時、宣言情報を保存
        @IBAction func savaDeclaration(_ sender: Any) {

            //保存しますかの表示
            let alert = UIAlertController(title: "確認", message: "保存しますか？", preferredStyle: UIAlertController.Style.alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) -> Void in
                print("OK")
                
                //TextFieldから文字を取得
                //UserDefaultsに宣言内容のデータを保存
                 UserDefaults.standard.set(self.selfDec.text!,forKey: "declaration")
                self.decText.text = UserDefaults.standard.string(forKey: "declaration")
                
            })
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {(action: UIAlertAction!) -> Void in print("Cancel")})
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            present(alert,animated: true, completion: nil)
        }
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
            //キーボードを閉じる処理
            view.endEditing(true)
        }

            
        override func viewDidLoad() {
                super.viewDidLoad()
            // スクリーンサイズを取得
            let scrW:CGFloat = view.frame.size.width
            let scrH:CGFloat = view.frame.size.height
            let bgUI = UIColor(hex:"008000")
            let liUI = UIColor(hex:"1c1d1c")
            self.view.backgroundColor = UIColor(hex: "e6e6e6")
            let font = "Chalk-JP"
            if #available(iOS 15.0, *) {
                backButton.configuration = nil
                saveButton.configuration = nil
            }
    //ボタン、ラベルの表記設定
                backButton.setTitle("×",for: .normal)
                decLabel.text = "禁煙宣言"
                exLabel.text = "禁煙する上で宣言することを入力できます"
                self.decText.text = UserDefaults.standard.string(forKey: "declaration")
                saveButton.setTitle("保存",for: .normal)
     //入力欄
            selfDec.frame = CGRect(x: 0, y: 0 , width:scrW/1.3, height:scrH/10)
            selfDec.center = CGPoint(x: scrW/2, y: scrH/1.53)
            selfDec.backgroundColor = UIColor(hex:"999999")
            let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 30), .foregroundColor : UIColor.darkGray]
            selfDec.attributedPlaceholder = NSAttributedString(string: "ここから入力できます", attributes: attributes)
    //ラベル「禁煙宣言」の表記設定
            decLabel.frame = CGRect(x:0, y:0, width: 300, height: 80);
            // ラベルのセンターを位置をスクリーン中央に設定
            decLabel.center = CGPoint(x: scrW/2, y: scrH/8)
            // テキストを中央寄せ
            decLabel.textAlignment = NSTextAlignment.center
            // システムフォントをサイズ40に設定
            decLabel.font = UIFont(name:font, size: 50)
            decLabel.textColor = liUI
            decLabel.layer.shadowOffset = CGSize(width:6, height:6) 
            decLabel.layer.shadowOpacity = 0.5
            
    //ラベル「宣言してみよう」の表記設定
            exLabel.frame = CGRect(x:0, y:0, width: scrW, height: scrH/8);
            // ラベルのセンターを位置をスクリーン中央に設定
            exLabel.center = CGPoint(x: scrW/2, y: scrH/4.25)
            // テキストを中央寄せ
            exLabel.textAlignment = NSTextAlignment.center
            exLabel.font = UIFont(name:font, size:20)
            exLabel.textColor = liUI
            
    //ボタン「保存」の表記設定
            saveButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            saveButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            saveButton.layer.borderWidth = 2  // 5
            saveButton.layer.borderColor = liUI.cgColor
            saveButton.layer.cornerRadius = 20 // 7
            saveButton.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            saveButton.layer.shadowOpacity = 0.5  // 9
            saveButton.layer.shadowRadius = 10  // 10
            //saveButton.layer.shadowColor = UIColor.gray.cgColor  //11
            saveButton.frame = CGRect(x:0, y:0, width:scrW/4, height:scrH/12)
            saveButton.center = CGPoint(x: scrW/2, y: scrH/1.28)
            saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
    //ラベル「宣言内容」の表記設定
            decText.numberOfLines = 0
            decText.frame = CGRect(x:0, y:0, width: scrW/1.25, height: scrH/3.5);
            // ラベルのセンターを位置をスクリーン中央に設定
            decText.center = CGPoint(x: scrW/2, y: scrH/2.35)
            // テキストを中央寄せ
            decText.textAlignment = NSTextAlignment.center
            decText.font = UIFont(name:font, size: 45)
            decText.textColor = liUI
            decText.backgroundColor = bgUI.withAlphaComponent(0.5)
            //decText.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            decText.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            decText.layer.shadowOpacity = 0.5
            //decText.layer.cornerRadius = 10
            decText.layer.borderWidth = 2
            decText.layer.borderColor = liUI.cgColor
            
    //ボタン「戻る」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)  // white button
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            backButton.layer.borderWidth = 2  // 5
            backButton.layer.borderColor = liUI.cgColor  // 6
            backButton.layer.cornerRadius = 30  // 7
            backButton.layer.shadowOffset = CGSize(width: 10, height: 10 )  // 8
            backButton.layer.shadowOpacity = 0.5  // 9
            backButton.layer.shadowRadius = 10  // 10
            //backButton.layer.shadowColor = UIColor.gray.cgColor  //11
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            }

}
