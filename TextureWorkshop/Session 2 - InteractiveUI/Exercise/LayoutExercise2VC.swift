//
//  LayoutExercise1p2VC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 17/10/20.
//

import Foundation
import AsyncDisplayKit

internal class LayoutExercise2VC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 80, height: 80)
        node.image = UIImage(named: "product")
        return node
    }()
    
    private let titleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Title Lorem Ipsum")
        return node
    }()
    
    private let subtitleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Subtitle text.. lalala")
        return node
    }()
    
    private let backgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        return node
    }()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            let titleStack = ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .start, children: [self.titleTextNode,self.subtitleTextNode])
            let cardStack = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .center, children: [self.imageNode, titleStack])
            let background = ASBackgroundLayoutSpec(child: cardStack, background: self.backgroundNode)
            let insets =  UIEdgeInsets(top: 8, left: 8, bottom: .infinity, right: .infinity)
            let stack = ASInsetLayoutSpec(insets: insets, child: background)
            return stack
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
        let example = Exercise2CheatVC()
        navigationController?.pushViewController(example, animated: true)
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


