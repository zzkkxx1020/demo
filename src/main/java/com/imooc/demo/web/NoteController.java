package com.imooc.demo.web;


import com.imooc.demo.entity.Note;
import com.imooc.demo.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/note")
public class NoteController {
    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/listnote",method = RequestMethod.GET)
    private Map<String, Object> listnote(String type) {

        Map<String, Object> modelMap = new HashMap<String, Object>();
        List<Note> list = new ArrayList<Note>();
        list = noteService.getlistnote(type);
        modelMap.put("noteList", list);
        return modelMap;
    }

    @RequestMapping(value = "/getbynoteid",method = RequestMethod.GET)
    private Map<String, Object> getbynoteid(int noteId) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        List<Note> list = new ArrayList<Note>();
        list = noteService.getById(noteId);
        modelMap.put("noteIdList", list);
        return modelMap;
    }
    @RequestMapping(value = "/seek",method = RequestMethod.GET)
    private Map<String, Object> Seek(String title){
        Map<String, Object> modelMap = new HashMap<String, Object>();
        List<Note> list = new ArrayList<Note>();
        list = noteService.getSeek(title);
        modelMap.put("noteListSeek", list);
        return modelMap;
    }
}
