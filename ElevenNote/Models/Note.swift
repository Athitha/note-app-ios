//
//  Note.swift
//  ElevenNote


import Foundation

class Note : NSObject, NSCoding {
    var noteTitle = ""
    var noteText = ""
    var noteDate = NSDate()
    
    var shortDate : NSString {
        let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            return dateFormatter.stringFromDate(self.noteDate)
    }
    
    override init() {
        super.init()
    }
    
   
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(noteTitle, forKey: "title")
        aCoder.encodeObject(noteText, forKey: "text")
        aCoder.encodeObject(noteDate, forKey: "date")
    }
    
   
    required init(coder aDecoder: NSCoder) {
        self.noteTitle = aDecoder.decodeObjectForKey("title") as! String
        self.noteText  = aDecoder.decodeObjectForKey("text") as! String
        self.noteDate   = aDecoder.decodeObjectForKey("date") as! NSDate
    }
    
}