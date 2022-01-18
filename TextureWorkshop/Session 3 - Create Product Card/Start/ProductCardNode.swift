//
//  ProductCardNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class ProductCardNode: ASCellNode {
    let backgroundNode = ASDisplayNode()
    let imageNode: ProductCardImageNode
    var descriptionNode: ProductCardDescriptionNode
    
    init(model: Product) {
        descriptionNode = ProductCardDescriptionNode(description: model.description)
        descriptionNode.style.flexGrow = 1
        descriptionNode.style.flexShrink = 1
        imageNode = ProductCardImageNode(imageUrl: model.imageURL)
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        backgroundNode.backgroundColor = .white
        clipsToBounds = false
        setShadow()
    }
    
    
    func setShadow() {
        backgroundNode.cornerRadius = 8
        backgroundNode.shadowColor = UIColor.black.cgColor
        backgroundNode.shadowOpacity = 0.12
        backgroundNode.shadowOffset.height = 2
        backgroundNode.shadowRadius = 4

    }
    
    override func layout() {
        super.layout()
        // Optimize performance for rendering shadow
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [
                imageNode,
                descriptionNode
            ]
        )

        let mainInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
            child: mainStack
        )
        
        let backgroundInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: backgroundNode)
        return ASBackgroundLayoutSpec(child: mainInset, background: backgroundInset)

    }
}
