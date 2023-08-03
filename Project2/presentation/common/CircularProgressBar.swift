//
//  CircularProgressBar.swift
//  Project2
//
//  Created by user on 8/3/23.
//

import Foundation
import UIKit

class CircularProgressBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()

    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    private var progressEndPoint: CGFloat = 0

    func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")

        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }

    private func calculateProgressEndPoint(from percentage: Double) -> CGFloat {
        let progressPercentage = max(min(percentage, 100.0), 0.0) / 100.0
        return startPoint + CGFloat(progressPercentage) * (endPoint - startPoint)
    }

    func createCircularPath(x: Int, y: Int, progressPercentage: Double) {
        progressEndPoint = calculateProgressEndPoint(from: progressPercentage)

        let circularPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: 25, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        let progressPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: 25, startAngle: startPoint, endAngle: progressEndPoint, clockwise: true)

        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.black.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 17.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.black.cgColor

        layer.addSublayer(circleLayer)

        progressLayer.path = progressPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 6.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor

        layer.addSublayer(progressLayer)
    }
}
