//
//  Library14ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library14ViewController: UIViewController {
    //ボタン、ラベルの接続
        @IBOutlet weak var lib14Label: UILabel!
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
            scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*1.1)
            scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
            scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
            scrollView.layer.borderColor = liUI.cgColor
            scrollView.layer.borderWidth = 2
            scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
    //ボタン、ラベルの表記設定
            backButton.setTitle("×",for: .normal)
            lib14Label.text = "4.喫煙に対する世論"
            exLabel.text = "　日本では「健康増進法」が2003年に制定され、禁煙に対する意識が高まったことにより、各年代においても喫煙率に低下傾向がみられました。禁煙促進を期待し、2020年4月には「改正健康増進法」が完全施行され、職場や飲食店における屋内原則禁煙が義務付けられました。また、受動喫煙を防ぐ為に屋外でも喫煙可能なスペースが撤去されつつあります。加えて、2018年から加熱式タバコを含むたばこ税の段階的引き上げが始まり、100円以上の値上げが見込まれます。たばこの警告表示付きパッケージや広告規制、禁煙治療における保険の適用など、喫煙率減少に向けた環境整備が進められています。 \r\r＜参考文献＞\r・中村正和, \"わが国の喫煙の現状と禁煙治療をめぐる最近のトピックス\". 新薬と臨牀　J.New Rem. & Clin. Vol.69 No.9. 2020年. pp.65(1109)-66(1110).　\r・東山明子・高橋裕子・橋本泰裕. \"日本の喫煙・禁煙成功・失敗率の調査と検討\". 禁煙科学 14巻. 2020年. p.2　\r・中村正和. \"わが国のたばこ規制・対策の現状\". e-ヘルスネット（厚生労働省）. 2018年6月8日. e-healthnet.mhlw.go.jp/infomation/tobacco/t-04-004.html"
            
    //表題ラベルの表記設定
            lib14Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib14Label.center = CGPoint(x: scrW/2, y: scrH/8)
            lib14Label.textAlignment = NSTextAlignment.center
            lib14Label.font = UIFont(name: font, size: 40)
            lib14Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib14Label.layer.shadowOpacity = 0.4
            lib14Label.textColor = liUI
            exLabel.numberOfLines = 0
            exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.1);
            // ラベルのセンターを位置をスクリーン中央に設定
            exLabel.center = CGPoint(x: scrW/2, y: scrH/1.8)
            // テキストを中央寄せ
            //explain11.textAlignment = NSTextAlignment.center
            exLabel.font = UIFont(name:font, size:20)
            exLabel.textColor = UIColor(hex:"1c1d1c")
            
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
