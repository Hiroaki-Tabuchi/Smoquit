//
//  Library13ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library13ViewController: UIViewController {
    //ボタン、ラベルの接続
        @IBOutlet weak var lib13Label: UILabel!
        @IBOutlet var exLabel: UILabel!
        @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //画面遷移
        @IBAction func backL1(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library1 View Controller")as! Library1ViewController
            self.present(next, animated: true, completion: nil)
        }
                
        override func viewDidLoad() {
            super.viewDidLoad()
            // スクリーンサイズを取得
            let scrW:CGFloat = view.frame.size.width
            let scrH:CGFloat = view.frame.size.height
            let bgUI = UIColor(hex:"008000")
            let liUI = UIColor(hex:"1c1d1c")
            let font = "Chalk-JP"
            if #available(iOS 15.0, *) {
                backButton.configuration = nil
            }
            self.view.backgroundColor = UIColor(hex: "e6e6e6")
            scrollView.contentSize = CGSize(width:scrW/1.1, height:scrH*1.15)
            scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
            scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
            scrollView.layer.borderColor = liUI.cgColor
            scrollView.layer.borderWidth = 2
            scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
    //ボタン、ラベルの表記設定
            backButton.setTitle("×",for: .normal)
            lib13Label.text = "3.受動喫煙"
            exLabel.text = "　日本では受動喫煙との関連性がある肺がん・心筋梗塞・脳卒中・乳幼児突然死症候群だけで年間1.5万人が死亡しています。受動喫煙は副流煙・呼出煙が混合した「環境たばこ煙」を吸うことを指しており、喫煙者が吸う主流煙よりも多くの有害物質を含みます。日本では、受動喫煙により年間1.5万人が死亡しています。また、受動喫煙による肺がんのリスクは1.28倍、脳卒中のリスクは1.24倍とされています。更に、子供の呼吸器疾患や中耳炎を引き起こすことが指摘されています。\r　このように受動喫煙の健康影響は深刻で、早急に解決しなければならない問題の一つです。\r\r＜参考文献＞\r・中野和歌子, \"ニコチン依存症・禁煙治療とうつ病\", 各種疾患・病態におけるうつ病・気分障害の合併の実情　身体疾患とうつ病, DEPRESSION JOURNAL Vol.8 No.2, 2020年, pp.16(48)-17(49)　\r・中村正和. \"たばこの煙と受動喫煙\". e-ヘルスネット（厚生労働省）. 2018年6月26日. e-healthnet.mhlw.go.jp/infomation/tobacco/t-05-004.html \r・中村正和. \"受動喫煙-他人の喫煙の影響\". e-ヘルスネット（厚生労働省）. 2018年6月8日. e-healthnet.mhlw.go.jp/infomation/tobacco/t-02-005.html"
            
    //表題ラベルの表記設定
            lib13Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib13Label.center = CGPoint(x: scrW/2, y: scrH/8)
            lib13Label.textAlignment = NSTextAlignment.center
            lib13Label.font = UIFont(name: font, size: 40)
            lib13Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib13Label.layer.shadowOpacity = 0.4
            lib13Label.textColor = liUI
    //説明のラベル
            exLabel.numberOfLines = 0
            exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.15)
            exLabel.center = CGPoint(x: scrW/2, y: scrH/1.75)
            exLabel.font = UIFont(name:font, size:20)
            exLabel.textColor = liUI
                     
    //ボタン「設定」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7)  // white button
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            backButton.layer.borderWidth = 2  // 5
            backButton.layer.borderColor = liUI.cgColor  // 6
            backButton.layer.cornerRadius = 30  // 7
            backButton.layer.shadowOffset = CGSize(width:6, height:6)  // 8
            backButton.layer.shadowOpacity = 0.5  // 9
            backButton.layer.shadowRadius = 10  // 10
            //backButton.layer.shadowColor = UIColor.gray.cgColor  //11
            backButton.frame = CGRect(x:0, y:0, width:60, height:60)
            backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
            backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }

}
