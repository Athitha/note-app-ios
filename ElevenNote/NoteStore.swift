

import Foundation

class NoteStore {
    
    class var sharedNoteStore : NoteStore {
    struct Static {
        static let instance : NoteStore = NoteStore()
        }
        return Static.instance
    }
    
    
    private init() {
        load()
    }
    
    
    private var notes : [Note]!
    
    
    
    func createNote(theNote:Note = Note()) -> Note {
        notes.append(theNote)
        return theNote
    }
    
    
    
    func getNote(index:Int) -> Note {
        return notes[index]
    }
    
    
    func updateNote(#theNote:Note) {
        
    }
    
    func deleteNote(index:Int) {
        notes.removeAtIndex(index)
    }
    
    func deleteNote(withNote:Note) {
        
        for (i, note) in enumerate(notes) {
            if note === withNote {
                notes.removeAtIndex(i)
                return
            }
        }
        
    }
    
    
    func count() -> Int {
        return notes.count
    }
    
    
  
    func archiveFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths.first as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("NoteStore.plist")
        
        return path
    }
    
   
    func save() {
        NSKeyedArchiver.archiveRootObject(notes, toFile: archiveFilePath())
    }
    
    
   
    func load() {
        let filePath = archiveFilePath()
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(filePath) {
            notes = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! [Note]
        } else {
            notes = [Note]()
        }
    }
    
}