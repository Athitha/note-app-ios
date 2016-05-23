

import UIKit

class NoteDetailTableViewCell : UITableViewCell {
    
    
    weak var theNote : Note!
    
    
    @IBOutlet weak var noteTitleLabel : UILabel!
    @IBOutlet weak var noteDateLabel : UILabel!
    @IBOutlet weak var noteTextLabel : UILabel!
    
    
    func setupCell(theNote:Note) {
        
        self.theNote = theNote
        
        
        noteTitleLabel.text = theNote.noteTitle
        noteTextLabel.text = theNote.noteText
        noteDateLabel.text = theNote.shortDate as String
        
    }
    
}
