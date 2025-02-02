//
//  LayoutExercise2VC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 15/10/20.
//

import Foundation
import AsyncDisplayKit

internal class LayoutExercise3VC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    let cardNode = CustomNode()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            let insets = UIEdgeInsets(top: 8, left: 8, bottom: .infinity, right: .infinity)
            let insetLayout = ASInsetLayoutSpec(insets: insets, child: self.cardNode)
            return insetLayout
        }
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    // MARK: Functions
    
    private func setupNavigation() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Example", style: .plain, target: self, action: #selector(goToChildVC)), animated: false)
    }
    
    @objc private func goToChildVC() {
        let example = Exercise3CheatVC()
        navigationController?.pushViewController(example, animated: true)
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


