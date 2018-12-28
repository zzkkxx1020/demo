package com.imooc.demo.dao;

import com.imooc.demo.entity.Note;

import java.util.List;

public interface NoteDao {

    List<Note> getlistnote(String type);

    List<Note> getNoteById(int noteId);

    int delNote(int id);

    Note getByNoteId(int id);

    int addNote(Note note);

    int updateBody(Note note);

    List<Note> getSeek(String title);
}
