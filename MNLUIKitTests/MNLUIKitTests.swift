import XCTest
@testable import MNLUIKit

class MNLUIKitTests: XCTestCase {

    var bundle: Bundle!

    override func setUp() {
        if (self.bundle == nil) {
            self.bundle = Bundle(for: MNLUIKitTests.self)
        }
    }

    func testNib() {
        let viewController = MNLTestViewController(nibName: "MNLTestView", bundle: self.bundle)
        viewController.loadViewIfNeeded()
        let view: MNLUIView! = viewController.mnlView
        let gradientView: MNLUIGradientView! = viewController.mnlGradientView
        XCTAssertNotNil(view)
        XCTAssertNotNil(gradientView)
        do {
            let layer = view.layer
            XCTAssertEqual(view.borderColor?.cgColor, layer.borderColor)
            XCTAssertEqual(view.borderWidth, layer.borderWidth)
            XCTAssertEqual(view.cornerRadius, MNLUIView.automaticCornerRadius)
            XCTAssertEqual(layer.cornerRadius, view.bounds.height / 2, accuracy: 1 / 2)
            XCTAssertNil(view.shadowColor)
            XCTAssertEqual(view.shadowOffset, layer.shadowOffset)
            XCTAssertEqual(view.shadowOpacity, layer.shadowOpacity)
            XCTAssertEqual(view.shadowPath?.cgPath, layer.shadowPath)
            XCTAssertEqual(view.shadowRadius, layer.shadowRadius)
        }
        do {
            let layer = gradientView.layer as! CAGradientLayer
            XCTAssertNil(gradientView.borderColor)
            XCTAssertEqual(gradientView.borderWidth, layer.borderWidth)
            XCTAssertEqual(gradientView.cornerRadius, layer.cornerRadius)
            XCTAssertNil(gradientView.shadowColor)
            XCTAssertEqual(gradientView.shadowOffset, layer.shadowOffset)
            XCTAssertEqual(gradientView.shadowOpacity, layer.shadowOpacity)
            XCTAssertEqual(gradientView.shadowPath?.cgPath, layer.shadowPath)
            XCTAssertEqual(gradientView.shadowRadius, 0)
            XCTAssertEqual(gradientView.startPoint, layer.startPoint)
            XCTAssertEqual(gradientView.endPoint, layer.endPoint)
        }
    }

    func testMNLUIViewPerformance() {
        var view = MNLUIView()
        self.measure {
            view = MNLUIView()
            view.backgroundColor = .white
            view.borderColor = .black
            view.borderWidth = 1
            view.shadowColor = .black
            view.shadowOffset = .init(width: 10, height: 10)
            view.shadowRadius = 20
            view.shadowOpacity = 0.3
        }
    }

    func testUIViewPerformance() {
        var view = UIView()
        self.measure {
            view = UIView()
            view.backgroundColor = .white
            view.layer.borderColor = UIColor.white.cgColor
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = 1
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = .init(width: 10, height: 10)
            view.layer.shadowRadius = 20
            view.layer.shadowOpacity = 0.3
        }
    }
}
