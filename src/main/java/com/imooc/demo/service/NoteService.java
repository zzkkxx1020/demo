package com.imooc.demo.service;

import com.imooc.demo.entity.Note;

import java.util.List;

public interface NoteService {
    List<Note> getlistnote(String type);

    List<Note> getById(int noteId);

    int delNote(int id);

    Note getByNoteId(int id);

    int addNote(Note note);

    int updateBody(Note note);

    List<Note> getSeek(String title);
}
