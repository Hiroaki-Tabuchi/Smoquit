//
//  SNSViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit
import CoreData

class SNSViewController: UIViewController {
    
    //ボタン、ラベルの接続
        @IBOutlet weak var SNSLabel: UILabel!
        @IBOutlet weak var exLabel: UILabel!
        @IBOutlet var SNSTop: UIButton!
        @IBOutlet var SNSDec: UIButton!
        @IBOutlet var backButton: UIButton!
    
    //ボタン操作、画面遷移
    //「活動を共有」を押下した際の操作
        @IBAction func SNSShareTop(_ sender: Any) {
    //活動内容をSNSに共有
            //Top View Controllerのインスタンスを作成
            let topView = storyboard!.instantiateViewController(withIdentifier: "View Controller") as! ViewController
            //TopViewControllerのスクリーンショットを作成
            UIGraphicsBeginImageContextWithOptions(topView.view.frame.size, false, 0.0)
            topView.view.drawHierarchy(in: topView.view.frame, afterScreenUpdates: true)
            let screenShotImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            //スリーンショットがUIImage型で取得できる
            UIGraphicsEndImageContext()
            let text = "禁煙の活動記録\r#Smoquit#禁煙支援\r"
            let url = NSURL(string: "https://smoquit")!
            let items = [text, url, screenShotImage] as [Any]
            // UIActivityViewControllerをインスタンス化
            let activityVc = UIActivityViewController(activityItems: items, applicationActivities: nil)
            // UIAcitivityViewControllerを表示
            self.present(activityVc, animated: true, completion: nil)
        }
        
    //「宣言を共有」を押した際の操作
        @IBAction func SNSShareDeclaration(_ sender: Any) {
            //テキストとURL（アプリ）のみ
            let decText = UserDefaults.standard.string(forKey: "declaration")
            let text = "＜禁煙宣言＞\r\(decText!)\r#Smoquit#禁煙支援\r"
            let url = NSURL(string: "https://smoquit")!
            let items = [text, url] as [Any]
            // UIActivityViewControllerをインスタンス化
            let activityVc = UIActivityViewController(activityItems: items, applicationActivities: nil)
            // UIAcitivityViewControllerを表示
            self.present(activityVc, animated: true, completion: nil)
        }
    //前画面へ戻る操作
        @IBAction func clickBack(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Setting View Controller")as! SettingViewController
            self.present(next, animated: true, completion: nil)
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
            
    //ボタン、ラベルの表記設定
            SNSTop.setTitle("活動を共有", for: .normal)
            SNSDec.setTitle("宣言を共有",for: .normal)
            SNSLabel.text = "SNS共有"
            exLabel.text = "禁煙活動をSNSで共有できます"
            backButton.setTitle("×",for: .normal)
            
    //ラベル「SNS共有」の表記設定
            SNSLabel.frame = CGRect(x:0, y:0, width:300, height:80);
            // ラベルのセンターを位置をスクリーン中央に設定
            SNSLabel.center = CGPoint(x: scrW/2, y: scrH/8)
            // テキストを中央寄せ
            SNSLabel.textAlignment = NSTextAlignment.center
            SNSLabel.font = UIFont(name:font, size: 50)
            SNSLabel.textColor = liUI
            SNSLabel.layer.shadowOffset = CGSize(width: 6, height: 6 )
            SNSLabel.layer.shadowOpacity = 0.4
    //説明ラベル
            exLabel.font = UIFont(name:font, size: 25)
            exLabel.frame = CGRect(x:0, y:0, width:350, height:40)
            exLabel.center = CGPoint(x: scrW/2, y: scrH/4.3)
            exLabel.textColor = liUI
            exLabel.layer.shadowOffset = CGSize(width: 6, height: 6 )
            exLabel.layer.shadowOpacity = 0.4
            
            if #available(iOS 15.0, *) {
                SNSTop.configuration = nil
                SNSDec.configuration = nil
                backButton.configuration = nil
            }
    //ボタン「活動を共有」の表記設定
            SNSTop.backgroundColor = bgUI.withAlphaComponent(0.7)
            SNSTop.setTitleColor(UIColor.white, for: UIControl.State.normal)
            SNSTop.layer.borderWidth = 3
            SNSTop.layer.borderColor = liUI.cgColor
            SNSTop.layer.cornerRadius = 10
            SNSTop.layer.shadowOffset = CGSize(width: 10, height: 10 )
            SNSTop.layer.shadowOpacity = 0.4
            SNSTop.layer.shadowRadius = 10
            SNSTop.frame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
            SNSTop.center = CGPoint(x: scrW/2, y: scrH/2.35)
            SNSTop.titleLabel?.font = UIFont(name:font, size:25)
    //ボタン「宣言を共有」の表記設定
                SNSDec.backgroundColor = bgUI.withAlphaComponent(0.7)
                SNSDec.setTitleColor(UIColor.white, for: UIControl.State.normal)
                SNSDec.layer.borderWidth = 3
                SNSDec.layer.borderColor = liUI.cgColor
                SNSDec.layer.cornerRadius = 10
                SNSDec.layer.shadowOffset = CGSize(width: 10, height: 10 )
                SNSDec.layer.shadowOpacity = 0.4
                SNSDec.layer.shadowRadius = 10
                SNSDec.frame = CGRect(x:0, y:0, width:scrW/1.3, height:scrH/7)
            SNSDec.center = CGPoint(x:scrW/2, y:scrH/1.63)
                SNSDec.titleLabel?.font = UIFont(name:font, size:25)
    //ボタン「戻る」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            backButton.layer.borderWidth = 3
            backButton.layer.borderColor = liUI.cgColor
            backButton.layer.cornerRadius = 30
            backButton.layer.shadowOffset = CGSize(width: 10, height: 10 )
            backButton.layer.shadowOpacity = 0.5
            backButton.layer.shadowRadius = 10
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                        
        }

}
