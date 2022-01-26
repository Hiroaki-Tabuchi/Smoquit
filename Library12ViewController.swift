//
//  Library12ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library12ViewController: UIViewController {
    //ボタン、ラベルの接続
            @IBOutlet weak var lib12Label: UILabel!
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
                scrollView.contentSize = CGSize(width:scrW/1.1, height:scrH*1.1)
                scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
                scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
                scrollView.layer.borderColor = liUI.cgColor
                scrollView.layer.borderWidth = 2
                scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
        //ボタン、ラベルの表記設定
                backButton.setTitle("×",for: .normal)
                lib12Label.text = "2.禁煙の困難性"
                exLabel.text = "　他セクションでの記載から喫煙の健康被害は明らかですが、ニコチンによる依存形成によりニコチン離脱に伴う症状の出現も相まって禁煙意識に関係なく禁煙の困難性を高めています。また、ニコチンは体への吸収・消失が速い為、常習喫煙者では喫煙後30分程でニコチン切れの症状が生じます。これが心理的・身体的依存の要因となり禁煙における最大の障壁です。このように喫煙習慣の本質はニコチン依存症と捉えられており、日本では2006年からニコチン依存症が治療対象となる病気として位置付けられるようになりました。禁煙の困難性を克服する為の方法は、他セクションで紹介している「②禁煙に関する知識」を参照していただけると幸いです。　\r\r＜参考文献＞\r・中野和歌子, \"ニコチン依存症・禁煙治療とうつ病\", 各種疾患・病態におけるうつ病・気分障害の合併の実情　身体疾患とうつ病, DEPRESSION JOURNAL Vol.8 No.2, 2020年, pp.16(48)-17(49)　\r・一般社団法人日本循環器学会. \"タバコの依存症\". 禁煙推進委員会. j-circ.or.jp/kinen/iryokankei/index.htm"
                
        //表題ラベルの表記設定
                lib12Label.frame = CGRect(x:0, y:0, width: scrW, height: 80);
                // ラベルのセンターを位置をスクリーン中央に設定
                lib12Label.center = CGPoint(x: scrW/2, y: scrH/8)
                // テキストを中央寄せ
                lib12Label.textAlignment = NSTextAlignment.center
                // システムフォントをサイズ40に設定
                lib12Label.font = UIFont(name:font, size: 40)
                lib12Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
                lib12Label.layer.shadowOpacity = 0.4
                lib12Label.textColor = liUI
        //説明のラベル
                exLabel.numberOfLines = 0
                exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.1)
                exLabel.center = CGPoint(x: scrW/2, y: scrH/1.95)
                exLabel.font = UIFont(name:font, size:20)
                exLabel.textColor = liUI
                
        //ボタン「設定」の表記設定
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
