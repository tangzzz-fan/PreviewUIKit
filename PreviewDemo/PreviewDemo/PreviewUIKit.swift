//
//  PreviewUIKit.swift
//  Restaurant
//
//  Created by 小苹果 on 2024/5/31.
//

import Foundation

#if DEBUG
import SwiftUI

/// Use Option + CMD + P to refresh Preview
public struct ViewControllerPreview<VC: UIViewController>: UIViewControllerRepresentable {
    
    /// Usage example:
    ///
    ///```
    ///#if DEBUG  // alsways include preview related code only into DEBUG config, no need to add this to release config
    ///import SwiftUI
    ///
    ///struct TestViewController_Previews: PreviewProvider {
    ///    static var previews: some View {
    ///        ViewControllerPreview<TestViewController>()
    ///    }
    ///}
    ///#endif
    ///```
    ///
    ///
    public init() {
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        VC()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

/// Use Option + CMD + P to refresh Preview
public struct ViewPreview<V: UIView>: UIViewRepresentable {
    
    private let frame: CGRect
    
    /// Method to reduce the boilerplate code for creating UIView previews.
    ///
    /// Usage example, preview for `DismissButton`:
    ///
    ///
    ///  ```
    /// struct DismissButton_Previews: PreviewProvider {
    ///
    ///     static let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    ///
    ///     static var previews: some View {
    ///         Group {
    ///             ViewPreview<DismissButton>.generatePreview(
    ///                 displayName: "Light mode",
    ///                 size: frame.size,
    ///                 previewLayout: .sizeThatFits
    ///             )
    ///
    ///             ViewPreview<DismissButton>.generatePreview(
    ///                 displayName: "Dark Mode",
    ///                 size: frame.size,
    ///                 previewLayout: .sizeThatFits,
    ///                 backgroundColor: Color(.systemBackground),
    ///                 colorScheme: .dark
    ///             )
    ///         }
    ///     }
    /// }
    /// #endif
    ///  ```
    ///
    /// - Parameters:
    ///   - displayName: Name to display alongside the preview
    ///   - size: We use this value to assign particular size for the preview
    ///   - previewLayout: switch from displaying device with bezel to just view with this param
    ///   - backgroundColor: set custom background color
    ///   - colorScheme: color scheme, default is .light
    /// - Returns: View that should be used int the preview
    public static func generatePreview(displayName: String? = nil,
                                       size: CGSize = .zero,
                                       previewLayout: PreviewLayout = .device,
                                       backgroundColor: Color? = nil,
                                       colorScheme: ColorScheme = .light) -> some View {
        return ViewPreview<V>(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            .frame(width: size.width, height: size.height)
            .padding() // padding for extra space between view and preview edge
            .previewLayout(previewLayout) // switch from displaying device with bezel to just view
            .background(backgroundColor) // Change background color to be based on current color scheme
            .environment(\.colorScheme, .dark) // Use dark scheme
            .previewDisplayName(displayName)
    }
    
    public init(frame: CGRect = .zero) {
        self.frame = frame
    }
    
    public func makeUIView(context: Context) -> some UIView {
        return V(frame: self.frame)
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
#endif
