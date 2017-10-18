package ru.spospekhov.notesapp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.spospekhov.notesapp.model.Note;
import ru.spospekhov.notesapp.service.NoteService;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

import static javax.swing.text.StyleConstants.ModelAttribute;

/**
 * Created by shy on 18.10.2017.
 */
@Controller
public class NoteController {
    @Autowired
    private NoteService noteService;

    @RequestMapping("/index")
    public String listNotes(Map<String, Object> map) {

        map.put("note", new Note());
        map.put("noteList", noteService.listNote());

        return "note";
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addNote(@ModelAttribute("note") Note note,
                             BindingResult result) {

        noteService.addNote(note);

        return "redirect:/index";
    }

    @RequestMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable("noteId") Integer noteId) {

        noteService.removeNote(noteId);

        return "redirect:/index";
    }
}