//
//  ViewController.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 04/01/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var shadowView: UIView = {
        let v = UIView()
        v.frame =  view.bounds
        v.alpha = 0.9
        v.backgroundColor = UIColor(named: "darkness")
        return v
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Futura Bold", size: 60)
        label.text = "UnPluq"
        label.textColor = UIColor(named: "margels")
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(shadowView)
        view.addSubview(titleLabel)
        view.bringSubviewToFront(shadowView)

        view.backgroundColor = UIColor(named: "Background")

        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true


    }

    override func viewDidAppear(_ animated: Bool) {
        titleLabel.alpha = 0
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 5
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowOffset = CGSize(width: 10, height: 0)

        rightShadow()
    }
    enum segment {

        case x
        case y
        case h

    }

    func calcTrig(segment: segment, size: CGFloat, angle: CGFloat) -> [segment : CGFloat] {

        switch segment {

            case .x:

                let x = size
                let y = tan(angle * .pi/180) * x
                let h = x / cos(angle * .pi/180)
                return [ .x : x, .y : y, .h : h]

            case .y:

                let y = size
                let x = y / tan(angle * .pi/180)
                let h = y / sin(angle * .pi/180)
                return [ .x : x, .y : y, .h : h]

            case .h:

                let h = size
                let x = cos(angle * .pi/180) * h
                let y = sin(angle * .pi/180) * h
                return [ .x : x, .y : y, .h : h]

        }

    }

    // shadow on the right, label starts appearing, light effect view makes view darker
    func rightShadow() {

        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {

            self.titleLabel.alpha = 0.75
            self.shadowView.alpha = 0.6

        } completion: { success in

            // move it lower
            self.rightHalfBottomShadow()

        }

    }

    // move shadow a bit lower, label fully appeared, light effect view gets lighter
    func rightHalfBottomShadow() {

        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear) {

            self.titleLabel.alpha = 1
            let trig = self.calcTrig(segment: .h, size: 10, angle: 22.5)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.5

        } completion: { success in

            self.rightBottomShadow()

        }

    }

    // move shadow to bottom right, light effect view creates light effect
    func rightBottomShadow() {

        UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {

            let trig = self.calcTrig(segment: .h, size: 10, angle: 45)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.4

        } completion: { success in

            self.halfRightBottomShadow()

        }

    }

    // move shadow more to the bottom, light eeffect view gets lighter
    func halfRightBottomShadow() {

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {

            let trig = self.calcTrig(segment: .h, size: 10, angle: 67.5)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.2

        } completion: { success in

            self.bottomShadow()

        }

    }

    // shadow is at the bottom, light effect view gets slightly darker
    func bottomShadow() {

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {

            let trig = self.calcTrig(segment: .h, size: 10, angle: 90)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.3

        } completion: { success in

            self.halfLeftBottomShadow()

        }

    }

    // shadow moves to the left and light effect view makes view darker
    func halfLeftBottomShadow() {

        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear) {

            let trig = self.calcTrig(segment: .h, size: 10, angle: 112.5)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.5

        } completion: { success in

            self.leftBottomShadow()

        }

    }

    // shadow moves to the bottom left and light effect view gets dark
    func leftBottomShadow() {

        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut) {

            let trig = self.calcTrig(segment: .h, size: 10, angle: 135)
            let x = trig[.x]
            let y = trig[.y]
            self.titleLabel.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.7

        } completion: { _ in
            guard let sceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate), let window = sceneDelegate.window else { return }
            let mainVC = MainViewController()
            window.rootViewController = mainVC
            window.makeKeyAndVisible()
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        }
    }

}

