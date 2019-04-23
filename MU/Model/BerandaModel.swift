//
//  File.swift
//  MU
//
//  Created by NDS on 14/04/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit
import SwiftyJSON

/*----- DATA MODEL FB POST -----*/
class FBModel: NSObject {
    var posts: [Post]?
    var paging: Paging?
    
    init(attributes: OptionalJSON) {
        super.init()
        posts = []
        ("data" =| attributes)?.forEach({ (element) in
            self.posts?.append(Post(attributes: element.dictionaryValue))
        })
        paging = Paging(attributes: "paging" =< attributes)
    }
}

class Post: NSObject {
    var idPost: String?
    var createdTime: String?
    var message: String?
    var fullPicture: String?
    var objectId: String?
    
    init(attributes: OptionalJSON) {
        super.init()
        idPost      = "id" => attributes
        createdTime = "created_time" => attributes
        message     = "message" => attributes
        fullPicture = "full_picture" => attributes
        objectId    = "object_id" => attributes
    }
}

class Paging: NSObject {
    var cursors: Cursors?
    var next: String?
    var previous: String?
    
    init(attributes: OptionalJSON) {
        super.init()
        cursors     = Cursors(attributes: "cursors" =< attributes)
        next        = "next" => attributes
        previous    = "previous" => attributes
    }
    
}

class Cursors: NSObject {
    var after: String?
    var before: String?
    
    init(attributes: OptionalJSON) {
        super.init()
        after   = "after" => attributes
        before  = "before" => attributes
    }
}

/*----- DATA MODEL DETAIL FB POST -----*/
class DetailFBPostModel: NSObject {
    var idDetailPost: String?
    var linkPost: String?
    var widthPic: String?
    var heightPic: String?
    
    init(attributes: OptionalJSON) {
        super.init()
        idDetailPost    = "id" => attributes
        linkPost        = "link" => attributes
        widthPic        = "width" => attributes
        heightPic       = "height" => attributes
    }
}
