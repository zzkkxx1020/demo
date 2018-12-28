package com.imooc.demo.entity;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class Note {
    private Integer noteId;
    private String noteTitle;
    private String noteBody;
    private String noteSource;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date noteTime;
    private String noteType;
    private String noteTitleImg;


    public String getNoteTitleImg() {
        return noteTitleImg;
    }

    public void setNoteTitleImg(String noteTitleImg) {
        this.noteTitleImg = noteTitleImg;
    }


    public String getNoteType() {
        return noteType;
    }

    public void setNoteType(String noteType) {
        this.noteType = noteType;
    }

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle;
    }

    public String getNoteBody() {
        return noteBody;
    }

    public void setNoteBody(String noteBody) {
        this.noteBody = noteBody;
    }

    public String getNoteSource() {
        return noteSource;
    }

    public void setNoteSource(String noteSource) {
        this.noteSource = noteSource;
    }

    public Date getNoteTime() {
        return noteTime;
    }

    public void setNoteTime(Date noteTime) {
        this.noteTime = noteTime;
    }

    @Override
    public String toString() {
        return "Note{" +
                "noteId=" + noteId +
                ", noteTitle='" + noteTitle + '\'' +
                ", noteBody='" + noteBody + '\'' +
                ", noteSource='" + noteSource + '\'' +
                ", noteTime=" + noteTime +
                ", noteType='" + noteType + '\'' +
                ", noteTitleImg='" + noteTitleImg + '\'' +

                '}';
    }
}
