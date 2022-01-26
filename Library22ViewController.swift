//
//  Library22ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library22ViewController: UIViewController {
    //ボタン、ラベルの接続
        @IBOutlet weak var lib22Label: UILabel!
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
            scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*1.68)
            scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
            scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
            scrollView.layer.borderColor = liUI.cgColor
            scrollView.layer.borderWidth = 2
            scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
    //ボタン、ラベルの表記設定
            backButton.setTitle("×",for: .normal)
            lib22Label.text = "2.喫煙の代替行動"
            exLabel.text = "　禁煙を行う上で、喫煙欲求を抑える為の「代替行動」が重要になってきます。代替行動によって心理的要因から喫煙動作を防止していきます。具体的な例として、喫煙欲求が生じる場面での代替行動が以下の通りになります。\r\r①朝起きてすぐ⇨すぐに顔を洗う\r②食事後⇨歯磨き\r③コーヒーのお供に⇨コーヒーを紅茶に変える\r④運転中⇨大声で歌う、深呼吸\r⑤仕事の休憩時間⇨職場の人に禁煙宣言をする\r⑥飲酒時⇨冷水を置いておき、吸いたくなったら飲む\r\rこの他にも、タバコに変わる嗜好品（ガム・飴・ニコチンを含まない電子タバコ）を喫煙欲求が生まれた際に活用することも一つの方法です。また、運動や瞑想でも喫煙欲求による苛立ちなどを解消することができます。そして、少しリスクのある方法ではありますが、他の依存性の高い行動に置き換えるやり方があります。この方法を行う際はリスクの大きさなども加味しながら検討すると良いでしょう。このように喫煙習慣を他の行動で置き換えることができるようになると、喫煙の習慣依存が低下していきます。今回挙げた代替行動は一部ですので、自分に適した方法で喫煙欲求を上手に抑えてみましょう。\r\r＜参考文献＞\r・谷口千枝. \"禁煙の準備-禁煙7日前から行う、禁煙のコツを教えます！《準備編》\". e-ヘルスネット（厚生労働省）. 2018年9月5日. https://www.e-healthnet.mhlw.go.jp/information/tobacco/t-06-002.html　\r・川井治之. \"禁煙が全くできない人が知らない3つの依存 体、心、習慣・・・それぞれ対処法は違う\". 東洋経済オンライン. 2017年9月8日. https://toyokeizai.net/articles/-/186575?page=3"

    //表題ラベルの表記設定
            lib22Label.frame = CGRect(x:0, y:0, width:scrW, height: 80)
            lib22Label.center = CGPoint(x: scrW/2, y: scrH/8)
            lib22Label.textAlignment = NSTextAlignment.center
            lib22Label.font = UIFont(name: font, size: 40)
            lib22Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
            lib22Label.layer.shadowOpacity = 0.4
            lib22Label.textColor = liUI
            
            exLabel.numberOfLines = 0
            exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.68)
            exLabel.center = CGPoint(x: scrW/2, y: scrH/1.2)
            exLabel.font = UIFont(name:font, size:20)
            exLabel.textColor = liUI
            
    //ボタン「設定」の表記設定
            backButton.backgroundColor = bgUI.withAlphaComponent(0.7) // white button
            backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
            backButton.layer.borderWidth = 2   // 5
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
