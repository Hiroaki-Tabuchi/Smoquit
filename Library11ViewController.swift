//
//  Library11ViewController.swift
//  Smoquit2
//
//  Created by Eiko Takaoka Lab. on 2021/11/30.
//

import UIKit

class Library11ViewController: UIViewController {
    //ボタン、ラベルの接続
            @IBOutlet weak var lib11Label: UILabel!
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
                scrollView.contentSize = CGSize(width:scrW/1.05, height:scrH*1.3)
                scrollView.frame = CGRect(x:0,y:0, width:scrW/1.03, height:scrH/1.5)
                scrollView.center = CGPoint(x:scrW/2,y:scrH/1.95)
                scrollView.layer.borderColor = liUI.cgColor
                scrollView.layer.borderWidth = 2
                scrollView.backgroundColor = bgUI.withAlphaComponent(0.7)
        //ボタン、ラベルの表記設定
                backButton.setTitle("×",for: .normal)
                lib11Label.text = "1.喫煙者への有害性"
                exLabel.text = "　日本国内における成人の喫煙率は年々減少しています。この背景には、日本国内の禁煙促進に向けた活動等が起因していると考えられます。しかし、加熱式タバコの普及や禁煙治療への不十分なアクセスによって減少率の低下がみられます。このセクションでは禁煙への意識を高めていただく為に喫煙のリスクについてご説明いたします。\r　タバコの煙には5000種類以上の化学物質が含まれており、その内の70種類が発がん物質となります。また、喫煙は多くの悪性腫瘍や循環器疾患、呼吸器疾患等の疾患の危険因子とされています。世界では毎年700万人、先進国の中で喫煙率の高い日本国内では19万人以上が喫煙により死亡しています。 このように喫煙による健康被害は明白で、自身の身体を大きく蝕んでいきます。様々な病気を引き起こす喫煙を減らしていくことが、人々の健康増進に直接関係していくのです。\r\r＜参考文献＞\r・中村正和. \"わが国の喫煙の現状と禁煙治療をめぐる最近のトピックス\". 新薬と臨牀　J.New Rem. & Clin. Vol.69 No.9. 2020年. pp.65(1109)-66(1110)\r・中野和歌子. \"ニコチン依存症・禁煙治療とうつ病\". 各種疾患・病態におけるうつ病・気分障害の合併の実情　身体疾患とうつ病. DEPRESSION JOURNAL Vol.8 No.2, 2020年. pp.16(48)-17(49)"
                
        //表題ラベルの表記設定
                lib11Label.frame = CGRect(x:0, y:0, width:scrW, height:scrH/8)
                lib11Label.center = CGPoint(x: scrW/2, y: scrH/8)
                lib11Label.textAlignment = NSTextAlignment.center
                lib11Label.font = UIFont(name:font, size: 40)
                lib11Label.layer.shadowOffset = CGSize(width: 6, height: 6 )
                lib11Label.layer.shadowOpacity = 0.4
                lib11Label.textColor = liUI
       //説明のラベル
                exLabel.numberOfLines = 0
                exLabel.frame = CGRect(x:0, y:0, width: scrW/1.1, height: scrH*1.3)
                exLabel.center = CGPoint(x: scrW/2, y: scrH/1.65)
                exLabel.font = UIFont(name:font, size:20)
                exLabel.textColor = UIColor(hex:"1c1d1c")
        //ボタン「戻る」の表記設定
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
