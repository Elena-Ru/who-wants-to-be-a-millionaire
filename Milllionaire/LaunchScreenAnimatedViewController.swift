//
//  LaunchScreenAnimatedViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-22.
//

import UIKit

class LaunchScreenAnimatedViewController: UIViewController {
  
  let circleDiameter: CGFloat = 15.0
  let triangleSideLength: CGFloat = 90.0
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor(named: "background")
      let path = createTrianglePath()
     
      for index in 0..<3 {
        let circle = createCircle(with: UIColor(named: "accent") ?? .tintColor)
        circle.center = pointOnTriangle(for: index)
        view.addSubview(circle)
        animateCircle(circle, along: path, startingAt: CGFloat(index) *   1.0/3.0)
      }
  }
  
  func createCircle(with color: UIColor) -> UIView {
      let circle = UIView(frame: CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter))
      circle.backgroundColor = color
      circle.layer.cornerRadius = circleDiameter / 2
      return circle
  }
  
  func createTrianglePath() -> UIBezierPath {
      let path = UIBezierPath()
      path.move(to: pointOnTriangle(for: 0))
      path.addLine(to: pointOnTriangle(for: 2))
      path.addLine(to: pointOnTriangle(for: 1))
      path.close()
      return path
  }
  
  func pointOnTriangle(for vertex: Int) -> CGPoint {
      switch vertex {
      case 0:
        return CGPoint(x: view.center.x, y: view.center.y - triangleSideLength / 2)
      case 1:
        return CGPoint(x: view.center.x - triangleSideLength / 2 * sqrt(3.0) / 2,
                      y: view.center.y + triangleSideLength / 2 / 2)
      case 2:
        return CGPoint(x: view.center.x + triangleSideLength / 2 * sqrt(3.0) / 2,
                      y: view.center.y + triangleSideLength / 2 / 2)
      default:
        return .zero
      }
  }
  
  func animateCircle(_ circle: UIView, along path: UIBezierPath, startingAt fraction: CGFloat) {
      let animation = CAKeyframeAnimation(keyPath: "position")
      animation.path = path.cgPath
      animation.duration = 3.0
      animation.repeatCount = Float.infinity
      animation.timeOffset = CFTimeInterval(fraction * animation.duration)
      circle.layer.add(animation, forKey: nil)
  }
}
