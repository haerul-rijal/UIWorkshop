//
//  ProductCardShopNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardShopNode: ASDisplayNode {
    
    let badgeNode: ASImageNode?
    let nameNode = ASTextNode()
    
    init(shop: Product.Description.Shop) {
        switch shop.type {
            case .officialStore:
                badgeNode = ASImageNode()
                badgeNode?.image = UIImage(named: "official_store")
            case .powerMerchant:
                badgeNode = ASImageNode()
                badgeNode?.image = UIImage(named: "power_merchant")
            case .none:
                badgeNode = nil
        }
        badgeNode?.style.preferredSize = CGSize(width: 16, height: 16)

        nameNode.attributedText = NSAttributedString(
            string: shop.name,
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.darkGray
            ]
        )
        nameNode.style.flexGrow = 1
        nameNode.style.flexShrink = 1
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let children: [ASLayoutElement]
//        if let badgeNode = badgeNode { // safe unwrap
//            children = [badgeNode, nameNode]
//        } else {
//            children = [nameNode]
//        }
        let children: [ASLayoutElement] = [badgeNode, nameNode].compactMap { $0 }
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: children
        )
    }
}
