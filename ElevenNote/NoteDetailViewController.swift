

import UIKit

class NoteDetailViewController: UIViewController {
    
    var theNote = Note()
    
    @IBOutlet weak var noteTitleLabel: UITextField!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
                self.noteTitleLabel.text = theNote.noteTitle
        self.noteTextView.text = theNote.noteText
        
        
        self.noteTextView.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        theNote.noteTitle = self.noteTitleLabel.text
        theNote.noteText = self.noteTextView.text
    }
    
}
