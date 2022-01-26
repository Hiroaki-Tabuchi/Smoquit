//
//  Library21ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library21ViewController: UIViewController {
    //ボタン、ラベルの接続
        @IBOutlet weak var lib21Label: UILabel!
        @IBOutlet var exLabel: UILabel!
        @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //画面遷移
        @IBAction func backL2(_ sender: Any) {
            let storyboard: UIStoryboard = self.storyboard!
            let next = storyboard.instantiateViewController(withIdentifier:"Library2 View Controller")as! Library2ViewController
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
            scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*2.4)
            scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
            scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
            scrollView.layer.borderColor = liUI.cgColor
            scrollView.layer.borderWidth = 2
            scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
    //ボタン、ラベルの表記設定
            backButton.setTitle("×",for: .normal)
            lib21Label.text = "1.禁煙方法について"
            exLabel.text = "　禁煙を行う方法として、自力で行う方法・禁煙外来での治療・代替品を用いた治療法などがあります。それぞれの方法について具体的に説明していきたいと思います。\r　まずは自力での禁煙についてですが、成功率は10％といわれています。しかし、多くの人が自力で行っている為、禁煙方法の中では最も成功者数が多いとされています。いつでも始めることができ、費用も抑えられることができます。誰でも始めやすい方法ですが、自制心を強く持つ必要があります。喫煙欲求に耐えられない場合は、禁煙に関する相談などを行っているクイットラインを活用してみると良いでしょう。本アプリでは自力で禁煙を行う方々に向けたサービスを提供しており、禁煙の継続をサポートしております。\r　次に禁煙外来での治療についてですが、成功率は自力での禁煙の3倍で、3ヶ月で70％の人が禁煙に成功しているといわれています。メリットとしては、禁煙補助薬などと併用することで1日中効果が継続し、禁煙後の体重増加の軽減が期待されます。逆にデメリットとしては、費用が3ヶ月で1.3〜2万円程かかり、突然の喫煙欲求に対応できないことが挙げられます。また、禁煙補助薬を服用している期間は運転や運動の制限があるので、自分のスケジュールなどを調整してから受診する必要があります。\r　最後にたばこの代替品を用いた治療ですが、ニコチンを含むパッチやガム、電子タバコなどを用いて行います。自力での禁煙の1.7倍の成功率であり、服用を遵守した場合はさらに効果があります。また、手軽に購入でき即効性がある為、喫煙欲求を抑制することができます。しかし、用量・用法を厳守する必要がある上、薬剤師の指導が必要となります。また、自力での禁煙に比べ費用がかかります。\r　このように様々な禁煙の方法があり、自分に適した方法で禁煙を行うことで禁煙成功率をより高くすることができます。　\r\r＜参考文献＞\r・厚生労働省. \"第3章　たばこ依存症の治療と禁煙方法\". 厚生労働省. 2002年. https://www.mhlw.go.jp/topics/tobacco/kin-en-sien/izonshou/03.html \r・ひまわり医院(内科・皮膚科). \"禁煙外来と禁煙補助薬（チャンピックス・ニコチンパッチ）について【成功率・費用・副作用】\". https://www.soujinkai.or.jp/himawariNaiHifu/kinengairai/\r・一般社団法人くまもと禁煙推進フォーラム. \"今すぐ禁煙を考えているあなたはどの方法？\". 2019年. https://square.umin.ac.jp/nosmoke/ \r・SS Mikkelsen 他. KKE94 「支援を利用せず自力禁煙した特徴とは」. 禁煙科学 8巻　p.15. 2014年  "
            
    //表題ラベルの表記設定
            lib21Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib21Label.center = CGPoint(x: scrW/2, y: scrH/8)
            lib21Label.textAlignment = NSTextAlignment.center
            lib21Label.font = UIFont(name: font, size: 40)
            lib21Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib21Label.layer.shadowOpacity = 0.4
            lib21Label.textColor = liUI
            
            exLabel.numberOfLines = 0
            exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*2.4)
            exLabel.center = CGPoint(x: scrW/2, y: scrH/0.855)
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
