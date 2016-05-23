import UIKit

class NotesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        editing = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "NoteDetailPush" {
            
            var noteInfo = segue.destinationViewController as! NoteDetailViewController
            
            var Cell = sender as! NoteDetailTableViewCell
            
            noteInfo.theNote = Cell.theNote
        }
    }
    
    
    @IBAction func saveFromNoteDetail(segue:UIStoryboardSegue) {
        
        
        
        var noteInfo = segue.sourceViewController as! NoteDetailViewController
        
        
        if let indexPath = tableView.indexPathForSelectedRow() {
                        NoteStore.sharedNoteStore.updateNote(theNote: noteInfo.theNote)
            
            
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        } else {
                        NoteStore.sharedNoteStore.createNote(theNote: noteInfo.theNote)
            
            
            var indexPath = NSIndexPath(forRow: NoteStore.sharedNoteStore.count()-1, inSection: 0)
            
        
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NoteStore.sharedNoteStore.count()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteDetailTableViewCell", forIndexPath: indexPath) as! NoteDetailTableViewCell
        
        
        var rowNumber = indexPath.row
        var theNote = NoteStore.sharedNoteStore.getNote(rowNumber)
        
        
        cell.setupCell(theNote)
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            NoteStore.sharedNoteStore.deleteNote(indexPath.row)
                        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
}
