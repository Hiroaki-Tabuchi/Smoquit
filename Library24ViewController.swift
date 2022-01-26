//
//  Library24ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library24ViewController: UIViewController {

    //ボタン、ラベルの接続
            @IBOutlet weak var lib24Label: UILabel!
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
                scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*1.18)
                scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
                scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
                scrollView.layer.borderColor = liUI.cgColor
                scrollView.layer.borderWidth = 2
                scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
        //ボタン、ラベルの表記設定
                backButton.setTitle("×",for: .normal)
                lib24Label.text = "4.禁煙のコツ"
                exLabel.text = "　禁煙を続けるコツとして、禁煙へスムーズに移行する為の準備が大切です。まずは禁煙開始日を設定してみましょう。また、自分が禁煙する理由を明確化し禁煙宣言もどこかに記載することで、禁煙開始後に辛くなった時でも初心に戻って禁煙について考え直すことができます。\r　次に、喫煙欲求が生まれた場合の対象法を考えておきましょう。禁煙を開始した後に現れるシーンに応じた代替行動を考えておくことで、急な喫煙欲求に対処することができます。参考として、具体的な方法は「3.禁煙の代替行動」のセクションに記載しておりますのでご覧いただけると幸いです。\r　そして、無意識に行っていた喫煙という行動に対して違和感を持てるようにしましょう。禁煙前に意識的に喫煙することで、禁煙中に無意識な喫煙行動を防ぐことができます。\r　最後に、禁煙補助薬を事前に検討・購入しておくことで禁煙が楽に継続できます。これは禁煙される方々の環境・状況によって活用いただければと思います。　\r\r＜参考文献＞\r・谷口千枝. \"禁煙の準備-禁煙7日前から行う、禁煙のコツを教えます！《準備編》\". e-ヘルスネット（厚生労働省）. 2018年9月5日. https://www.e-healthnet.mhlw.go.jp/information/tobacco/t-06-002.html"
                
        //表題ラベルの表記設定
                lib24Label.frame = CGRect(x:0, y:0, width: scrW, height: 80);
                // ラベルのセンターを位置をスクリーン中央に設定
                lib24Label.center = CGPoint(x: scrW/2, y: scrH/8)
                // テキストを中央寄せ
                lib24Label.textAlignment = NSTextAlignment.center
                lib24Label.font = UIFont(name: font, size: 40)
                lib24Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
                lib24Label.layer.shadowOpacity = 0.4
                lib24Label.textColor = liUI
                
                exLabel.numberOfLines = 0
                exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.18)
                exLabel.center = CGPoint(x: scrW/2, y: scrH/1.7)
                exLabel.font = UIFont(name:font, size:20)
                exLabel.textColor = UIColor(hex:"1c1d1c")
                
        //ボタン「設定」の表記設定
                backButton.backgroundColor = bgUI.withAlphaComponent(0.7)  // white button
                backButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
                backButton.layer.borderWidth = 2  // 5
                backButton.layer.borderColor = liUI.cgColor  // 6
                backButton.layer.cornerRadius = 30  // 7
                backButton.layer.shadowOffset = CGSize(width: 6, height:6)  // 8
                backButton.layer.shadowOpacity = 0.5  // 9
                backButton.layer.shadowRadius = 10  // 10
                //backButton.layer.shadowColor = UIColor.gray.cgColor  //11
                backButton.frame = CGRect(x:0, y:0, width:60, height:60)
                backButton.center = CGPoint(x: scrW/2, y: scrH/1.1)
                backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            }

}
