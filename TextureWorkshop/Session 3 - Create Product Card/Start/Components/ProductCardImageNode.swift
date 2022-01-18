//
//  ProductCardImageNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardImageNode: ASDisplayNode {
    let imageNode: ASNetworkImageNode
    let wishlistNode = ProductCardWishlistNode()
    
    init(imageUrl: URL?) {
        imageNode = ASNetworkImageNode()
        imageNode.url = imageUrl
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
        imageNode.cornerRadius = 6
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wishlistInset = ASInsetLayoutSpec(
          insets: UIEdgeInsets(top: 4, left: 4, bottom: .infinity, right: .infinity),
          child: wishlistNode
        )
        return ASOverlayLayoutSpec(child: imageNode, overlay: wishlistInset)
    }
}
