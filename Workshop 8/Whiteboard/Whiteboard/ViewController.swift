//
//  ViewController.swift
//  Whiteboard
//
//  Created by Jesse Tipton on 11/1/17.
//  Copyright © 2017 MAD. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    var paths = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard !paths.isEmpty else { return }
        
        context.setStrokeColor(UIColor.black.cgColor)
        
        for path in paths {
            guard !path.isEmpty else { return }
            let bezier = UIBezierPath(rect: rect)
            bezier.move(to: path.first!)
            for point in path {
                bezier.addLine(to: point)
            }
            context.addPath(bezier.cgPath)
            context.drawPath(using: .stroke)
        }
    }
    
}

class ViewController: UIViewController {

    func addPoint(_ point: CGPoint) {
        let canvas = self.view as! CanvasView
        canvas.paths[canvas.paths.count - 1].append(point)
        canvas.setNeedsDisplay()
    }
    
    func startPath(at point: CGPoint) {
        let canvas = self.view as! CanvasView
        canvas.paths.append([point])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        startPath(at: touch.location(in: self.view))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        self.addPoint(touch.location(in: self.view))
    }

}

