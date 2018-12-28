package com.imooc.demo.service.impl;

import com.imooc.demo.dao.NoteDao;
import com.imooc.demo.entity.Note;
import com.imooc.demo.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteServiceImpl implements NoteService {
    @Autowired
    private NoteDao noteDao;

    @Override
    public List<Note> getlistnote(String type) {

        return noteDao.getlistnote(type);
    }

    @Override
    public List<Note> getById(int noteId) {
        return noteDao.getNoteById(noteId);
    }

    @Override
    public int delNote(int id) {
        return noteDao.delNote(id);
    }

    @Override
    public Note getByNoteId(int id) {
        return noteDao.getByNoteId(id);
    }

    @Override
    public int addNote(Note note) {
        return  noteDao.addNote(note);
    }

    @Override
    public int updateBody(Note note) {
        return noteDao.updateBody(note);
    }

    @Override
    public List<Note> getSeek(String title) {
        return noteDao.getSeek(title);
    }
}
