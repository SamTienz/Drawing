//
//  MainVC.swift
//  Drawing
//
//  Created by Tien on 2017/10/31.
//  Copyright © 2017年 Tien. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet var MainView: MainView!
    var width:CGFloat = 0
    var height:CGFloat = 0
    var circleLayer:CAShapeLayer!
    var triangleLayer:CAShapeLayer!
    var fanLayer:CAShapeLayer!
    var lineLayer:CAShapeLayer!
    var sineLayer:CAShapeLayer!
    var cosLayer:CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.bounds.width //整個view的寬
        height = self.view.bounds.height //整個view的高
        // Do any additional setup after loading the view.
    }
    @IBAction func CircleSwAction(_ sender: UISwitch) {
        if sender.isOn{drawCircle()}
        else{circleLayer.removeFromSuperlayer()}
    }
    @IBAction func TriSwAction(_ sender: UISwitch) {
        if sender.isOn{drawTriangle()}
        else{triangleLayer.removeFromSuperlayer()}
    }
    @IBAction func FanSwAction(_ sender: UISwitch) {
        if sender.isOn{drawFan()}
        else{fanLayer.removeFromSuperlayer()}
    }
    @IBAction func LineSwAcion(_ sender: UISwitch) {
        if sender.isOn{drawLine()}
        else{lineLayer.removeFromSuperlayer()}
    }
    @IBAction func SinSwAction(_ sender: UISwitch) {
        if sender.isOn{drawSine()}
        else{sineLayer.removeFromSuperlayer()}
    }
    @IBAction func CosSwAction(_ sender: UISwitch) {
        if sender.isOn{drawCos()}
        else{cosLayer.removeFromSuperlayer()}
    }
    func drawCircle(){
        circleLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x:width/2 , y: height/2), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.yellow.cgColor //內部顏色
        circleLayer.strokeColor = UIColor.black.cgColor //筆畫顏色
        self.MainView.layer.addSublayer(circleLayer)
    }
    func drawTriangle(){
        triangleLayer = CAShapeLayer()
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: width/2-50, y: height/2+50))
        trianglePath.addLine(to: CGPoint(x: width/2+50, y: height/2+50))
        trianglePath.addLine(to: CGPoint(x: width/2, y: height/2-50))
        trianglePath.addLine(to: CGPoint(x: width/2-50, y: height/2+50))
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.strokeColor = UIColor.black.cgColor
        triangleLayer.fillColor = UIColor.brown.cgColor
        self.MainView.layer.addSublayer(triangleLayer)
    }
    func drawFan(){
        let fanPath = UIBezierPath(arcCenter: CGPoint(x: width/2, y: height/2), radius: 100, startAngle: 0, endAngle: CGFloat(60*Double.pi/180), clockwise: true)
        fanLayer = CAShapeLayer()
        fanPath.addLine(to: CGPoint(x: width/2, y: height/2))
        fanPath.close()
        fanLayer.path = fanPath.cgPath
        fanLayer.fillColor = UIColor.blue.cgColor
        fanLayer.strokeColor = UIColor.black.cgColor
        self.MainView.layer.addSublayer(fanLayer)
    }
    func drawLine(){
        let linePath = UIBezierPath()
        lineLayer = CAShapeLayer()
        linePath.move(to: CGPoint(x: width/2, y: height/2))
        linePath.addLine(to: CGPoint(x: width/2+50*pow(2, 0.5), y: height/2+50*pow(2, 0.5)))
        lineLayer.path = linePath.cgPath
        lineLayer.strokeColor = UIColor.red.cgColor
        self.MainView.layer.addSublayer(lineLayer)
    }
    func drawSine(){
        let linePath = UIBezierPath()
        sineLayer = CAShapeLayer()
        linePath.move(to: CGPoint(x: width/2-75, y: height/2))
        for angle in stride(from: 1.0, to: 360.0, by: 1.0) {
            let x = CGFloat(width/2-75) + CGFloat(angle/360) * 150
            let y = CGFloat(height/2) - CGFloat(sin(angle*Double.pi/180)) * 150 * 0.3
            linePath.addLine(to: CGPoint(x: x, y: y))
        }
        sineLayer.path = linePath.cgPath
        sineLayer.strokeColor = UIColor.black.cgColor
        sineLayer.fillColor = UIColor.clear.cgColor
        self.MainView.layer.addSublayer(sineLayer)
    }
    func drawCos(){
        let linePath = UIBezierPath()
        cosLayer = CAShapeLayer()
        linePath.move(to: CGPoint(x: width/2-75, y: height/2))
        for angle in stride(from: 90.0, to: 451.0, by: 1.0) {
            let x = CGFloat(width/2-75) + CGFloat((angle-90)/360) * 150
            let y = CGFloat(height/2) - CGFloat(cos(angle*Double.pi/180)) * 150 * 0.3
            linePath.addLine(to: CGPoint(x: x, y: y))
        }
        cosLayer.path = linePath.cgPath
        cosLayer.strokeColor = UIColor.black.cgColor
        cosLayer.fillColor = UIColor.clear.cgColor
        self.MainView.layer.addSublayer(cosLayer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
