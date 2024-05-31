//
//  TestFile.swift
//  Restaurant
//
//  Created by 小苹果 on 2024/5/31.
//

import Foundation

final class Example {
    
    let color: UIColor = .red
    
}

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
    }
    
    private func configureSubviews() {
        view.backgroundColor = .white
        
        let imageView = UIView()
        imageView.backgroundColor = .purple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
}

#if DEBUG
import SwiftUI

struct TestViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview<TestViewController>()
    }
}

struct Button_Previews: PreviewProvider {
    
    static let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    
    static var previews: some View {
        Group {
            ViewPreview<UIButton>.generatePreview(
                displayName: "Light mode",
                size: frame.size,
                previewLayout: .sizeThatFits,
                backgroundColor: Color(.orange)
            )
            
            ViewPreview<UIButton>.generatePreview(
                displayName: "Dark Mode",
                size: frame.size,
                previewLayout: .sizeThatFits,
                backgroundColor: Color(.systemBackground),
                colorScheme: .dark
            )
        }
    }
}
#endif
