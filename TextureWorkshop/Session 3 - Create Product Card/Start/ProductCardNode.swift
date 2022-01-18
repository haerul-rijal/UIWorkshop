//
//  ProductCardNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class ProductCardNode: ASDisplayNode {
    
    let imageNode: ProductCardImageNode
    var descriptionNode: ProductCardDescriptionNode
    
    init(model: Product) {
        descriptionNode = ProductCardDescriptionNode(description: model.description)
        imageNode = ProductCardImageNode(imageUrl: model.imageURL)
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        setShadow()
    }
    
    
    func setShadow() {
        clipsToBounds = false
        cornerRadius = 8
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.12
        shadowOffset.height = 2
        shadowRadius = 4
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
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            child: mainStack
        )

        return mainInset
    }
}
